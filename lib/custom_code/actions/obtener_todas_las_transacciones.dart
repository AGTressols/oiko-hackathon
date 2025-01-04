// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Importaciones necesarias
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> obtenerTodasLasTransacciones() async {
  try {
    print('OBTENER TODAS LAS TRANSACCIONES: Iniciando proceso.');

    // 1. Obtener las colecciones referenciadas desde FFAppState y crear mapas de NOMBRE a datos
    List<CuentaCacheStructStruct> cuentasList = FFAppState().cacheCuentas;
    Map<String, CuentaCacheStructStruct> cuentasMapName = {};
    for (var cuenta in cuentasList) {
      if (cuenta.cuenta != null) {
        cuentasMapName[cuenta.cuenta!] = cuenta;
      }
    }
    print(
        'OBTENER TODAS LAS TRANSACCIONES: Se obtuvieron ${cuentasMapName.length} cuentas del usuario');

    List<CategoriasCacheStructStruct> categoriasList =
        FFAppState().cacheCategorias;
    Map<String, CategoriasCacheStructStruct> categoriasMapName = {};
    for (var categoria in categoriasList) {
      if (categoria.categoria != null) {
        categoriasMapName[categoria.categoria!] = categoria;
      }
    }
    print(
        'OBTENER TODAS LAS TRANSACCIONES: Se obtuvieron ${categoriasMapName.length} categorías del usuario');

    // 2. Obtener todas las transacciones desde FFAppState()
    List<TotalidadDeTransaccionesStruct> transaccionesList = [];
    transaccionesList.addAll(FFAppState().transaccionesGasto);
    transaccionesList.addAll(FFAppState().transaccionesIngreso);
    transaccionesList.addAll(FFAppState().transaccionesAhorro);
    transaccionesList.addAll(FFAppState().transaccionesAjuste);
    transaccionesList.addAll(FFAppState().transaccionesTraspaso);

    print(
        'OBTENER TODAS LAS TRANSACCIONES: Se obtuvieron ${transaccionesList.length} transacciones');

    // Ordenar las transacciones por fecha descendente
    transaccionesList.sort((a, b) {
      DateTime fechaA = DateTime.parse(a.fecha ?? '1970-01-01');
      DateTime fechaB = DateTime.parse(b.fecha ?? '1970-01-01');
      return fechaB.compareTo(fechaA);
    });

    // 3. Procesar cada transacción y aplicar las condiciones
    List<TodasTransaccionesStruct> todasTransaccionesList = [];

    for (var transData in transaccionesList) {
      String movimiento = transData.movimiento ?? '';
      bool desahorro = transData.desahorro ?? false;

      // Ignorar transacción si movimiento es "Ahorro" y desahorro es true
      if (movimiento == 'Ahorro' && desahorro == true) {
        print('Transacción ignorada (movimiento: Ahorro, desahorro: true)');
        continue;
      }

      // Obtener y verificar la fecha
      DateTime? fechaTransaccion;
      if (transData.fecha != null && transData.fecha!.isNotEmpty) {
        fechaTransaccion = DateTime.parse(transData.fecha!);
      } else {
        print('Transacción tiene fecha nula o inválida, se omite.');
        continue;
      }

      // Lógica para Ajuste:
      double montoFinal;
      double? montoAhorroFinal = null;
      double montoAhorroOrigen = transData.montoAhorro ?? 0.0;

      if (movimiento == 'Ajuste' && montoAhorroOrigen != 0.0) {
        // Usar montoAhorro como monto principal
        montoFinal = montoAhorroOrigen;
        montoAhorroFinal = montoAhorroOrigen;
      } else {
        // Caso normal
        montoFinal = transData.monto ?? 0.0;

        if (movimiento == 'Ahorro') {
          double montoDivisa = transData.montoDivisa ?? 0.0;
          double montoAhorroTrans = transData.montoAhorro ?? 0.0;
          if (montoDivisa == 0) {
            montoAhorroFinal = montoAhorroTrans;
          } else {
            montoAhorroFinal = montoDivisa;
          }
        }
      }

      // Crear el objeto TodasTransaccionesStruct
      TodasTransaccionesStruct transaccion = TodasTransaccionesStruct(
        fecha: fechaTransaccion,
        movimiento: movimiento,
        monto: montoFinal,
        montoAhorro: montoAhorroFinal,
        montoDivisa: transData.montoDivisa ?? 0.0,
        cuenta: transData.cuenta ?? '',
        categoria: transData.categoria ?? '',
        etiqueta: transData.etiqueta ?? '',
        observacion: transData.observacion ?? '',
        cuentaCredito: transData.cuentaCredito ?? '',
        logo: '',
        logoCuenta: '',
        logoCuentaCredito: '',
        refTransaccion: transData.docRefTransac,
        refCuenta: transData.docRefCuenta,
        refCategoria: transData.docRefCategoria,
        refCuentaCredito: transData.docRefCuentaCredito,
        refEtiqueta: transData.docRefEtiqueta,
      );

      // Obtener logos y nombres de cuentas
      String cuentaName = transaccion.cuenta;
      var cuentaData = cuentasMapName[cuentaName];
      if (cuentaData != null) {
        transaccion.logoCuenta = cuentaData.logo ?? '';
        transaccion.cuenta = cuentaData.cuenta ?? cuentaName;
      } else {
        transaccion.logoCuenta = '';
        transaccion.cuenta = cuentaName;
      }

      // Para cuentaCredito
      String cuentaCreditoName = transaccion.cuentaCredito ?? '';
      CuentaCacheStructStruct? cuentaCreditoData;
      if (cuentaCreditoName.isNotEmpty) {
        cuentaCreditoData = cuentasMapName[cuentaCreditoName];
        if (cuentaCreditoData != null) {
          transaccion.logoCuentaCredito = cuentaCreditoData.logo ?? '';
          transaccion.cuentaCredito =
              cuentaCreditoData.cuenta ?? cuentaCreditoName;
        } else {
          transaccion.logoCuentaCredito = '';
          transaccion.cuentaCredito = cuentaCreditoName;
        }
      } else {
        transaccion.logoCuentaCredito = '';
      }

      // Asignar logo de categoría si no es Ajuste
      if (movimiento != 'Ajuste') {
        String categoriaName = transaccion.categoria;
        var categoriaData = categoriasMapName[categoriaName];
        if (categoriaData != null) {
          transaccion.logo = categoriaData.logo ?? '';
          transaccion.categoria = categoriaData.categoria ?? categoriaName;
        } else {
          transaccion.logo = '';
          transaccion.categoria = categoriaName;
        }
      } else {
        transaccion.logo = '';
      }

      // Determinar divisaBool
      // Si la cuenta o la cuentaCredito tienen divisa distinta de "$ARS", divisaBool = true
      bool divisaBoolVal = false;

      // Verificar cuenta principal
      if (cuentaData != null &&
          cuentaData.divisa != null &&
          cuentaData.divisa != '\$ARS') {
        divisaBoolVal = true;
      }

      // Verificar cuentaCredito si aún es false
      if (!divisaBoolVal && cuentaCreditoName.isNotEmpty) {
        var cCreditoData = cuentasMapName[cuentaCreditoName];
        if (cCreditoData != null &&
            cCreditoData.divisa != null &&
            cCreditoData.divisa != '\$ARS') {
          divisaBoolVal = true;
        }
      }

      transaccion.divisaBool = divisaBoolVal;

      todasTransaccionesList.add(transaccion);
    }

    print(
        'OBTENER TODAS LAS TRANSACCIONES: Se procesaron ${todasTransaccionesList.length} transacciones');

    // 4. Asignar la lista al AppState 'todasTransacciones'
    FFAppState().todasTransacciones = todasTransaccionesList;

    print('OBTENER TODAS LAS TRANSACCIONES: Datos almacenados en el AppState');

    // 5. Agrupar transacciones por mes y movimiento
    Map<String, double> totalIngresoPorMes = {};
    Map<String, double> totalGastoPorMes = {};
    Map<String, double> totalAhorroPorMes = {};
    Map<String, double> totalAjustePorMes = {};

    Set<String> mesesSet = {};
    List<String> meses = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic'
    ];

    for (var transaccion in todasTransaccionesList) {
      if (transaccion.movimiento == 'Traspaso') {
        continue;
      }

      if (transaccion.fecha != null) {
        DateTime fecha = transaccion.fecha!;
        int mesIndex = fecha.month - 1;
        String mesNombre = meses[mesIndex];
        String anio = fecha.year.toString().substring(2);
        String mesAnio = '$mesNombre $anio';

        mesesSet.add(mesAnio);

        if (transaccion.movimiento == 'Ingreso') {
          totalIngresoPorMes[mesAnio] =
              (totalIngresoPorMes[mesAnio] ?? 0.0) + (transaccion.monto ?? 0.0);
        } else if (transaccion.movimiento == 'Gasto') {
          totalGastoPorMes[mesAnio] =
              (totalGastoPorMes[mesAnio] ?? 0.0) + (transaccion.monto ?? 0.0);
        } else if (transaccion.movimiento == 'Ahorro') {
          double montoAhorroVal = transaccion.montoAhorro ?? 0.0;
          totalAhorroPorMes[mesAnio] =
              (totalAhorroPorMes[mesAnio] ?? 0.0) + montoAhorroVal;
        } else if (transaccion.movimiento == 'Ajuste') {
          totalAjustePorMes[mesAnio] =
              (totalAjustePorMes[mesAnio] ?? 0.0) + (transaccion.monto ?? 0.0);
        }
      }
    }

    List<String> mesesList = mesesSet.toList();
    mesesList.sort((a, b) {
      List<String> aParts = a.split(' ');
      List<String> bParts = b.split(' ');
      int aMesIndex = meses.indexOf(aParts[0]);
      int bMesIndex = meses.indexOf(bParts[0]);
      int aAnio = int.parse(aParts[1]);
      int bAnio = int.parse(bParts[1]);

      if (aAnio != bAnio) {
        return aAnio.compareTo(bAnio);
      } else {
        return aMesIndex.compareTo(bMesIndex);
      }
    });

    List<double> totalIngresoGraficoGeneral = [];
    List<double> totalGastoGraficoGeneral = [];
    List<double> totalAhorroGraficoGeneral = [];
    List<double> totalAjusteGraficoGeneral = [];

    for (String mesAnio in mesesList) {
      totalIngresoGraficoGeneral.add(totalIngresoPorMes[mesAnio] ?? 0.0);
      totalGastoGraficoGeneral.add(totalGastoPorMes[mesAnio] ?? 0.0);
      totalAhorroGraficoGeneral.add(totalAhorroPorMes[mesAnio] ?? 0.0);
      totalAjusteGraficoGeneral.add(totalAjustePorMes[mesAnio] ?? 0.0);
    }

    FFAppState().fechaIngresoGastoAhorro = mesesList;
    FFAppState().totalIngresoGraficoGeneral = totalIngresoGraficoGeneral;
    FFAppState().totalGastoGraficoGeneral = totalGastoGraficoGeneral;
    FFAppState().totalAhorroGraficoGeneral = totalAhorroGraficoGeneral;
    FFAppState().totalAjusteGraficoGeneral = totalAjusteGraficoGeneral;

    print(
        'OBTENER INGRESO GASTO AHORRO: Datos almacenados en los AppStates correspondientes');
  } catch (e, stacktrace) {
    print('OBTENER TODAS LAS TRANSACCIONES: Error: $e');
    print('Stacktrace: $stacktrace');
  }
}
