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
import '/backend/schema/structs/index.dart'; // Asegúrate de que este import incluye los structs necesarios
import '/flutter_flow/flutter_flow_util.dart'; // Asegúrate de que FFAppState está definido aquí

Future<void> procesarDatosDeCuentas() async {
  // Inicializar las listas para almacenar los datos de las cuentas
  List<Map<String, dynamic>> listaGastosCuentas = [];
  List<Map<String, dynamic>> listaIngresosCuentas = [];

  try {
    print('PROCESAR DATOS DE CUENTAS: Iniciando función');

    // Obtener los períodos seleccionados desde el App State
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

    // Verificar que hay períodos seleccionados
    if (seleccionPeriodos.isEmpty) {
      print('PROCESAR DATOS DE CUENTAS: No hay períodos seleccionados.');
      return;
    }

    // Mapear los nombres de meses a números de meses
    Map<String, int> meses = {
      'Enero': 1,
      'Febrero': 2,
      'Marzo': 3,
      'Abril': 4,
      'Mayo': 5,
      'Junio': 6,
      'Julio': 7,
      'Agosto': 8,
      'Septiembre': 9,
      'Octubre': 10,
      'Noviembre': 11,
      'Diciembre': 12,
    };

    // Convertir los períodos seleccionados a rangos de fechas
    List<Map<String, DateTime>> rangosDeFechas = [];

    for (String mesAnio in seleccionPeriodos) {
      // Ajuste para manejar 'Mes' o 'Mes Año'
      List<String> partes = mesAnio.split(' ');

      String mesTexto;
      int year;

      if (partes.length == 2) {
        // Formato 'Mes Año'
        mesTexto = partes[0];
        year = int.tryParse(partes[1]) ?? DateTime.now().year;
      } else if (partes.length == 1) {
        // Formato 'Mes' - Asumimos el año actual
        mesTexto = partes[0];
        year = DateTime.now().year;
      } else {
        print('PROCESAR DATOS DE CUENTAS: Formato de mes inválido: $mesAnio');
        continue;
      }

      int? mesNumero = meses[mesTexto];

      if (mesNumero == null) {
        print('PROCESAR DATOS DE CUENTAS: Mes inválido: $mesTexto');
        continue;
      }

      DateTime inicio = DateTime(year, mesNumero, 1);
      DateTime fin;

      if (mesNumero == 12) {
        fin = DateTime(year + 1, 1, 0, 23, 59, 59);
      } else {
        fin = DateTime(year, mesNumero + 1, 0, 23, 59, 59);
      }

      rangosDeFechas.add({'inicio': inicio, 'fin': fin});
    }

    // Verificar que tenemos al menos un rango de fechas válido
    if (rangosDeFechas.isEmpty) {
      print(
          'PROCESAR DATOS DE CUENTAS: No se pudieron obtener rangos de fechas válidos.');
      return;
    }

    // Variables para almacenar el gasto e ingreso total de todas las cuentas
    double gastoTotal = 0;
    double ingresoTotal = 0;

    // Obtener las cuentas desde FFAppState().cacheCuentas y crear un mapa de nombre de cuenta a cuenta
    List<CuentaCacheStructStruct> cacheCuentas = FFAppState().cacheCuentas;
    Map<String, CuentaCacheStructStruct> cuentasMap = {};
    for (var cuenta in cacheCuentas) {
      if (cuenta.cuenta != null) {
        cuentasMap[cuenta.cuenta!] = cuenta;
      }
    }

    // *** Procesar las transacciones de tipo "Gasto" ***
    print(
        'PROCESAR DATOS DE CUENTAS: Procesando transacciones de tipo "Gasto"');

    // Obtener las transacciones de tipo "Gasto" desde FFAppState().transaccionesGasto
    List<TotalidadDeTransaccionesStruct> transaccionesGasto =
        FFAppState().transaccionesGasto;

    for (var transaccion in transaccionesGasto) {
      // Parsear la fecha de la transacción
      if (transaccion.fecha != null && transaccion.fecha!.isNotEmpty) {
        try {
          DateTime fechaTransaccion = DateTime.parse(transaccion.fecha!);

          // Verificar si la transacción está dentro de alguno de los rangos de fechas seleccionados
          bool dentroDeRango = false;
          for (var rango in rangosDeFechas) {
            if (fechaTransaccion.isAfter(
                    rango['inicio']!.subtract(Duration(milliseconds: 1))) &&
                fechaTransaccion
                    .isBefore(rango['fin']!.add(Duration(milliseconds: 1)))) {
              dentroDeRango = true;
              break;
            }
          }
          if (!dentroDeRango) continue;

          // Obtener el monto de la transacción
          double monto = transaccion.monto ?? 0.0;

          // Obtener el nombre de la cuenta de la transacción
          String? cuentaNombre = transaccion.cuenta;
          if (cuentaNombre == null) {
            print('PROCESAR DATOS DE CUENTAS - GASTO: Transacción sin cuenta.');
            continue;
          }

          // Obtener el nombre y el logo de la cuenta desde cuentasMap
          var cuentaData = cuentasMap[cuentaNombre];

          if (cuentaData == null) {
            print(
                'PROCESAR DATOS DE CUENTAS - GASTO: La cuenta con nombre $cuentaNombre no existe en cacheCuentas.');
            continue;
          }

          String nombreCuenta = cuentaData.cuenta ?? 'Sin nombre';
          String logoCuenta = cuentaData.logo ?? '';

          // Buscar si la cuenta ya está en la lista
          int index = listaGastosCuentas.indexWhere(
            (gastoCuenta) => gastoCuenta['cuenta'] == nombreCuenta,
          );

          if (index == -1) {
            // Si la cuenta no existe, agregar un nuevo objeto a la lista
            Map<String, dynamic> nuevaCuenta = {
              'cuenta': nombreCuenta,
              'logo': logoCuenta,
              'monto': monto,
              'restoMonto': 0,
            };
            listaGastosCuentas.add(nuevaCuenta);
          } else {
            // Si la cuenta ya existe, sumar el monto al total existente
            listaGastosCuentas[index]['monto'] += monto;
          }

          // Sumar el monto al gasto total
          gastoTotal += monto;
        } catch (e) {
          print(
              'PROCESAR DATOS DE CUENTAS - GASTO: Error al procesar transacción: $e');
          continue;
        }
      }
    }

    // Calcular el resto de gasto por cada cuenta
    for (var gastoCuenta in listaGastosCuentas) {
      gastoCuenta['restoMonto'] = gastoTotal - gastoCuenta['monto'];
    }

    // Guardar los detalles de gastos en el App State
    FFAppState().gastosPorCuenta = listaGastosCuentas
        .map((e) => GastosCuentasStruct(
              cuenta: e['cuenta'] as String,
              logo: e['logo'] as String,
              monto: e['monto'] as double,
              restoMonto: e['restoMonto'] as double,
            ))
        .toList();

    print('PROCESAR DATOS DE CUENTAS: Datos de gasto procesados correctamente');

    // *** Procesar las transacciones de tipo "Ingreso" ***
    print(
        'PROCESAR DATOS DE CUENTAS: Procesando transacciones de tipo "Ingreso"');

    // Obtener las transacciones de tipo "Ingreso" desde FFAppState().transaccionesIngreso
    List<TotalidadDeTransaccionesStruct> transaccionesIngreso =
        FFAppState().transaccionesIngreso;

    for (var transaccion in transaccionesIngreso) {
      // Parsear la fecha de la transacción
      if (transaccion.fecha != null && transaccion.fecha!.isNotEmpty) {
        try {
          DateTime fechaTransaccion = DateTime.parse(transaccion.fecha!);

          // Verificar si la transacción está dentro de alguno de los rangos de fechas seleccionados
          bool dentroDeRango = false;
          for (var rango in rangosDeFechas) {
            if (fechaTransaccion.isAfter(
                    rango['inicio']!.subtract(Duration(milliseconds: 1))) &&
                fechaTransaccion
                    .isBefore(rango['fin']!.add(Duration(milliseconds: 1)))) {
              dentroDeRango = true;
              break;
            }
          }
          if (!dentroDeRango) continue;

          // Obtener el monto de la transacción
          double monto = transaccion.monto ?? 0.0;

          // Obtener el nombre de la cuenta de la transacción
          String? cuentaNombre = transaccion.cuenta;
          if (cuentaNombre == null) {
            print(
                'PROCESAR DATOS DE CUENTAS - INGRESO: Transacción sin cuenta.');
            continue;
          }

          // Obtener el nombre y el logo de la cuenta desde cuentasMap
          var cuentaData = cuentasMap[cuentaNombre];

          if (cuentaData == null) {
            print(
                'PROCESAR DATOS DE CUENTAS - INGRESO: La cuenta con nombre $cuentaNombre no existe en cacheCuentas.');
            continue;
          }

          String nombreCuenta = cuentaData.cuenta ?? 'Sin nombre';
          String logoCuenta = cuentaData.logo ?? '';

          // Buscar si la cuenta ya está en la lista
          int index = listaIngresosCuentas.indexWhere(
            (ingresoCuenta) => ingresoCuenta['cuenta'] == nombreCuenta,
          );

          if (index == -1) {
            // Si la cuenta no existe, agregar un nuevo objeto a la lista
            Map<String, dynamic> nuevaCuenta = {
              'cuenta': nombreCuenta,
              'logo': logoCuenta,
              'monto': monto,
              'restoMonto': 0,
            };
            listaIngresosCuentas.add(nuevaCuenta);
          } else {
            // Si la cuenta ya existe, sumar el monto al total existente
            listaIngresosCuentas[index]['monto'] += monto;
          }

          // Sumar el monto al ingreso total
          ingresoTotal += monto;
        } catch (e) {
          print(
              'PROCESAR DATOS DE CUENTAS - INGRESO: Error al procesar transacción: $e');
          continue;
        }
      }
    }

    // Calcular el resto de ingreso por cada cuenta
    for (var ingresoCuenta in listaIngresosCuentas) {
      ingresoCuenta['restoMonto'] = ingresoTotal - ingresoCuenta['monto'];
    }

    // Guardar los detalles de ingresos en el App State
    FFAppState().ingresosPorCuenta = listaIngresosCuentas
        .map((e) => GastosCuentasStruct(
              cuenta: e['cuenta'] as String,
              logo: e['logo'] as String,
              monto: e['monto'] as double,
              restoMonto: e['restoMonto'] as double,
            ))
        .toList();

    print(
        'PROCESAR DATOS DE CUENTAS: Datos de ingreso procesados correctamente');
  } catch (e) {
    print('PROCESAR DATOS DE CUENTAS: Error: $e');
  }
}
