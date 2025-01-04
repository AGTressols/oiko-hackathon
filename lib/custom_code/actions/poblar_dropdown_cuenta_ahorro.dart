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

Future<void> poblarDropdownCuentaAhorro() async {
  try {
    print('POBLAR DROPDOWN CUENTA AHORRO: Iniciando proceso.');

    // Obtener las cuentas desde FFAppState().cacheCuentas
    List<CuentaCacheStructStruct> cacheCuentas = FFAppState().cacheCuentas;

    // Filtrar las cuentas donde 'ahorro' es true
    List<CuentaCacheStructStruct> cuentasAhorro =
        cacheCuentas.where((cuenta) => cuenta.ahorro == true).toList();

    print(
        'POBLAR DROPDOWN CUENTA AHORRO: Se encontraron ${cuentasAhorro.length} cuentas de ahorro.');

    // Extraer el campo 'cuenta' de cada cuenta de ahorro
    List<String> cuentasDeAhorro =
        cuentasAhorro.map((cuenta) => cuenta.cuenta ?? 'Sin nombre').toList();

    // Asignar la lista al AppState
    FFAppState().cuentasDeAhorroDropdown = cuentasDeAhorro;

    print(
        'POBLAR DROPDOWN CUENTA AHORRO: Cuentas de ahorro cargadas exitosamente en el AppState.');
  } catch (e) {
    print('Error al poblar el dropdown de cuentas de ahorro: $e');
  }
}
