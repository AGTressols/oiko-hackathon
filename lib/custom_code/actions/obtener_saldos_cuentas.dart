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

Future<void> obtenerSaldosCuentas() async {
  try {
    print('OBTENER SALDOS CUENTAS: Iniciando proceso.');

    // Obtener las cuentas desde FFAppState().cacheCuentas
    List<CuentaCacheStructStruct> cacheCuentas = FFAppState().cacheCuentas;

    // Filtrar las cuentas donde 'ahorro' es false
    List<CuentaCacheStructStruct> cuentasNoAhorro = cacheCuentas
        .where((cuenta) => cuenta.ahorro == false || cuenta.ahorro == null)
        .toList();

    print(
        'OBTENER SALDOS CUENTAS: Se encontraron ${cuentasNoAhorro.length} cuentas no ahorro.');

    // Inicializar la lista para 'saldosCuentas' y la variable para 'saldoGeneral'
    List<SaldosCuentasAppStateStruct> listaSaldosCuentas = [];
    double saldoGeneral = 0.0;

    // Iterar sobre las cuentas no ahorro
    for (var cuenta in cuentasNoAhorro) {
      // Obtener los campos necesarios
      String cuentaNombre = cuenta.cuenta ?? 'Sin nombre';
      double tap = cuenta.tap ?? 0.0;
      String logo = cuenta.logo ?? '';

      // Crear el struct para 'saldosCuentas'
      SaldosCuentasAppStateStruct saldoCuenta = SaldosCuentasAppStateStruct(
        cuenta: cuentaNombre,
        saldo: tap,
        logo: logo,
      );

      // Agregar a la lista de saldosCuentas
      listaSaldosCuentas.add(saldoCuenta);

      // Sumar al saldoGeneral
      saldoGeneral += tap;

      print(
          'OBTENER SALDOS CUENTAS: Cuenta $cuentaNombre, TAP $tap, Logo $logo');
    }

    // Asignar la lista al AppState 'saldosCuentas'
    FFAppState().saldosCuentas = listaSaldosCuentas;

    // Asignar el saldoGeneral al AppState 'saldoGeneral'
    FFAppState().saldoGeneral = saldoGeneral;

    print('OBTENER SALDOS CUENTAS: Datos almacenados en el AppState');
    print('OBTENER SALDOS CUENTAS: Saldo general: $saldoGeneral');
  } catch (e) {
    print('OBTENER SALDOS CUENTAS: Error al procesar las cuentas: $e');
  }
}
