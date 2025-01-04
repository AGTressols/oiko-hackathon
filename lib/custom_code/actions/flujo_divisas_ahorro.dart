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

import '/backend/schema/structs/index.dart'; // Asegúrate de que este import incluye los structs necesarios
import '/flutter_flow/flutter_flow_util.dart'; // Asegúrate de que FFAppState está definido aquí

import 'package:firebase_auth/firebase_auth.dart'; // Import necesario para FirebaseAuth

Future<void> flujoDivisasAhorro() async {
  try {
    print('FLUJO DIVISA: Iniciando flujoDivisasAhorro');

    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('FLUJO DIVISA: No hay usuario autenticado');
    }
    print('FLUJO DIVISA: UID obtenido: $uid');

    // Leer la AppState flowCuentaCredito (datatype con campos 'nombre' y 'cuentaRef')
    final flowCuentaCredito = FFAppState().flowCuentaCredito;
    final String nombreCuenta = flowCuentaCredito.nombre ?? '';
    print('FLUJO DIVISA: Nombre de la cuenta obtenido: $nombreCuenta');

    // Obtener la cuenta desde FFAppState().cacheCuentas
    final cuentaData =
        FFAppState().cacheCuentas.firstWhere((c) => c.cuenta == nombreCuenta);

    if (cuentaData == null) {
      print(
          'FLUJO DIVISA: No se encontró la cuenta $nombreCuenta en cacheCuentas');
      throw Exception(
          'FLUJO DIVISA: No se encontró la cuenta $nombreCuenta en cacheCuentas');
    }

    // Inicializar variables ppp, tap y tad
    double ppp = cuentaData.ppp ?? 0.0;
    double tap = cuentaData.tap ?? 0.0;
    double tad = cuentaData.tad ?? 0.0;

    print('FLUJO DIVISA: ppp obtenido: $ppp');
    print('FLUJO DIVISA: tap obtenido: $tap');
    print('FLUJO DIVISA: tad obtenido: $tad');

    // Leer la AppState 'esAhorro'
    final bool esAhorro = FFAppState().esAhorro;
    print('FLUJO DIVISA: esAhorro: $esAhorro');

    if (esAhorro) {
      // Asignar AppStates a variables antes de pasarlas a la función
      final double montoDivisa = FFAppState().flowMontoDivisa;
      final double monto = FFAppState().flowMonto;
      final String cuentaAhorro = FFAppState().flowCuentaCredito.nombre ?? '';

      // Calcular montoAhorro
      double montoAhorro = 0.0;
      if (montoDivisa > 0) {
        montoAhorro = monto * -1;
        FFAppState().flowMontoAhorro = montoAhorro;

        print(
            'FLUJO DIVISA: montoAhorro calculado (montoDivisa positivo): $montoAhorro');
      } else {
        montoAhorro = montoDivisa * ppp;
        FFAppState().flowMontoAhorro = montoAhorro;

        print(
            'FLUJO DIVISA: montoAhorro calculado (montoDivisa negativo): $montoAhorro');
      }

      // Asignar montoAhorro a la AppState 'flowMontoAhorro'
      print(
          'FLUJO DIVISA: flowMontoAhorro actualizado a ${FFAppState().flowMontoAhorro}');

      print(
          'FLUJO DIVISA: Llamando a calcularPPPTAPyTAD con montoDivisa: $montoDivisa, monto: $monto, montoAhorro: $montoAhorro, cuentaAhorro: $cuentaAhorro');

      // Ejecutar la custom action 'calcularPPPTAPyTAD' con los parámetros requeridos
      await calcularPPPTAPyTAD(montoDivisa, monto, montoAhorro, cuentaAhorro);

      print('FLUJO DIVISA: calcularPPPTAPyTAD ejecutado correctamente');
    } else {
      // Manipular flowMontoDivisa (AppState)
      FFAppState().flowMontoDivisa *= -1;
      print(
          'FLUJO DIVISA: flowMontoDivisa actualizado a ${FFAppState().flowMontoDivisa}');

      // Cálculo de montoAhorro
      double montoAhorro = 0.0;
      if (FFAppState().flowMontoDivisa < 0) {
        montoAhorro = FFAppState().flowMontoDivisa * ppp;
        FFAppState().flowMontoAhorro = montoAhorro;
        print(
            'FLUJO DIVISA: montoAhorro calculado (flowMontoDivisa negativo): $montoAhorro');
      } else {
        // Manejo de errores si flowMontoDivisa es positivo
        montoAhorro = FFAppState().flowMontoDivisa;
        FFAppState().flowMontoAhorro = montoAhorro;
        print(
            'FLUJO DIVISA: montoAhorro calculado (flowMontoDivisa positivo): $montoAhorro');
      }

      // Obtener flowMonto
      double flowMonto = FFAppState().flowMonto;
      print('FLUJO DIVISA: flowMonto obtenido: $flowMonto');

      // Cálculo de montoResultado
      double montoResultado = flowMonto - (montoAhorro * -1);
      print('FLUJO DIVISA: montoResultado calculado: $montoResultado');

      // Determinar el tipo de movimiento y monto para la transacción
      String movimiento = '';
      double montoTransaccion = 0.0;

      if (montoResultado > 0) {
        movimiento = 'Ingreso';
        montoTransaccion = montoResultado;
      } else {
        movimiento = 'Gasto';
        montoTransaccion = montoResultado * -1;
      }
      print(
          'FLUJO DIVISA: movimiento: $movimiento, montoTransaccion: $montoTransaccion');

      // Buscar la categoría 'Resultados' en FFAppState().cacheCategorias
      final categoriaResultados = FFAppState()
          .cacheCategorias
          .firstWhere((cat) => cat.categoria == 'Resultados');

      if (categoriaResultados != null) {
        final String categoriaId = categoriaResultados.id;
        print('FLUJO DIVISA: categoriaId obtenido: $categoriaId');

        // Crear un DocumentReference a la categoría
        DocumentReference categoriaRef = FirebaseFirestore.instance
            .collection('Categorias')
            .doc(categoriaId);

        // Crear nuevo documento en la colección Transacciones
        print('FLUJO DIVISA: Creando documento en Transacciones');
        await FirebaseFirestore.instance.collection('Transacciones').add({
          'uid': uid,
          'fecha': Timestamp.now(),
          'movimiento': movimiento,
          'monto': montoTransaccion,
          'cuenta': flowCuentaCredito.cuentaRef,
          'categoria': categoriaRef,
          'montoDivisa': 0,
          'montoAhorro': 0,
          'timestamp': Timestamp.now()
        });
        print('FLUJO DIVISA: Documento creado en Transacciones');
      } else {
        // Manejar el caso donde no se encontró la categoría
        throw Exception(
            'FLUJO DIVISA: No se encontró la categoría "Resultados" en cacheCategorias.');
      }

      // **Actualización de TAP y TAD después de crear la transacción**

      // Calcular nuevoTap y nuevoTad
      double nuevoTap = tap + montoAhorro;
      double nuevoTad = tad + FFAppState().flowMontoDivisa;

      print('FLUJO DIVISA: nuevoTap calculado: $nuevoTap');
      print('FLUJO DIVISA: nuevoTad calculado: $nuevoTad');

      // Actualizar 'tap' y 'tad' en Firebase
      await FirebaseFirestore.instance
          .collection('Cuentas')
          .doc(cuentaData.id)
          .update({
        'tap': nuevoTap,
        'tad': nuevoTad,
      });
      print('FLUJO DIVISA: tap y tad actualizados en Firebase');

      // Actualizar 'tap' y 'tad' en FFAppState().cacheCuentas
      int cuentaIndex =
          FFAppState().cacheCuentas.indexWhere((c) => c.id == cuentaData.id);
      if (cuentaIndex != -1) {
        // Crear una nueva instancia de CuentaCacheStructStruct con los valores actualizados
        final updatedCuenta = CuentaCacheStructStruct(
          id: cuentaData.id,
          cuenta: cuentaData.cuenta,
          logo: cuentaData.logo,
          activa: cuentaData.activa,
          ahorro: cuentaData.ahorro,
          divisa: cuentaData.divisa,
          ppp: cuentaData.ppp,
          tap: nuevoTap,
          tad: nuevoTad,
        );

        // Actualizar la lista en FFAppState
        final updatedCacheCuentas =
            List<CuentaCacheStructStruct>.from(FFAppState().cacheCuentas);
        updatedCacheCuentas[cuentaIndex] = updatedCuenta;
        FFAppState().cacheCuentas = updatedCacheCuentas;
        print('FLUJO DIVISA: tap y tad actualizados en cacheCuentas');
      } else {
        print(
            'FLUJO DIVISA: No se encontró la cuenta en cacheCuentas para actualizar tap y tad');
      }
    }
    print('FLUJO DIVISA: flujoDivisasAhorro completado exitosamente');
  } catch (e) {
    // Manejo de errores
    print('FLUJO DIVISA: Error en flujoDivisasAhorro: $e');
  }
}
