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

Future<void> saldoCuentasAhorro() async {
  try {
    print('SALDO CUENTAS AHORRO: Iniciando función');

    // Obtener las cuentas de ahorro desde FFAppState().cacheCuentas
    List<CuentaCacheStructStruct> cacheCuentas = FFAppState().cacheCuentas;

    // Filtrar las cuentas donde 'ahorro' es true
    List<CuentaCacheStructStruct> cuentasAhorro =
        cacheCuentas.where((cuenta) => cuenta.ahorro == true).toList();

    print(
        'SALDO CUENTAS AHORRO: Se encontraron ${cuentasAhorro.length} cuentas de ahorro.');

    // Inicializar la lista para almacenar los datos de ahorro por cuenta
    List<AhorroPorCuentaStruct> listaAhorroCuentas = [];

    // Iterar sobre las cuentas de ahorro
    for (var cuenta in cuentasAhorro) {
      String nombreCuenta = cuenta.cuenta ?? 'Sin nombre';
      String logoCuenta = cuenta.logo ?? '';
      String divisaCuenta = cuenta.divisa ?? '';
      double totalDivisa;

      // Realizar la validación según el campo 'divisa'
      if (divisaCuenta == '\$ARS') {
        // Si la divisa es '$ARS', tomar el valor de 'tap'
        totalDivisa = cuenta.tap ?? 0.0;
        print(
            'SALDO CUENTAS AHORRO: Cuenta $nombreCuenta utiliza TAP ($totalDivisa) debido a que la divisa es $divisaCuenta');
      } else {
        // Si la divisa es diferente, tomar el valor de 'tad'
        totalDivisa = cuenta.tad ?? 0.0;
        print(
            'SALDO CUENTAS AHORRO: Cuenta $nombreCuenta utiliza TAD ($totalDivisa) debido a que la divisa es $divisaCuenta');
      }

      // Crear el objeto AhorroPorCuentaStruct
      AhorroPorCuentaStruct ahorroCuenta = AhorroPorCuentaStruct(
        nombre: nombreCuenta,
        logo: logoCuenta,
        divisa: divisaCuenta,
        totalDivisa: totalDivisa,
      );

      // Agregar a la lista
      listaAhorroCuentas.add(ahorroCuenta);
    }

    // Guardar los detalles de ahorro en el App State
    FFAppState().ahorroPorCuenta = listaAhorroCuentas;

    print('SALDO CUENTAS AHORRO: Datos de ahorro procesados correctamente');
  } catch (e) {
    print('SALDO CUENTAS AHORRO: Error: $e');
  }
}
