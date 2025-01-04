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

Future<void> saldoGeneral() async {
  try {
    print('SALDO GENERAL: Iniciando cálculo del saldo general.');

    // Inicializar el saldo total
    double saldoTotal = 0.0;

    // Obtener las cuentas desde FFAppState().cacheCuentas
    List<CuentaCacheStructStruct> cacheCuentas = FFAppState().cacheCuentas;

    // Verificar que la lista de cuentas no esté vacía
    if (cacheCuentas.isEmpty) {
      print('SALDO GENERAL: No hay cuentas en el cache.');
      FFAppState().saldoGeneral = saldoTotal;
      return;
    }

    // Iterar sobre las cuentas y sumar el tap de las que no son de ahorro
    for (var cuenta in cacheCuentas) {
      if (cuenta.ahorro == false) {
        // Sumar el tap de la cuenta al saldo total, asegurando que no sea nulo
        saldoTotal += cuenta.tap ?? 0.0;
      }
    }

    // Guardar el saldo total en el App State
    FFAppState().saldoGeneral = saldoTotal;

    print('SALDO GENERAL: Cálculo completado. Saldo General: $saldoTotal');
  } catch (e) {
    print('SALDO GENERAL: Error al calcular el saldo general: $e');
  }
}
