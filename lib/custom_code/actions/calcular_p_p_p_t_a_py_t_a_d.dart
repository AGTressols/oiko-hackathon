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

// Importación adicional para autenticación de Firebase
import 'package:firebase_auth/firebase_auth.dart';

Future<void> calcularPPPTAPyTAD(double montoDivisa, double monto,
    double montoAhorro, String cuentaAhorro) async {
  try {
    print('CALCULAR PPP, TAP y TAD: Iniciando función');

    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('No hay usuario autenticado');
    }
    print('CALCULAR PPP, TAP y TAD: UID obtenido: $uid');

    // Buscar la cuenta en el caché de FFAppState
    int indexCuenta = FFAppState()
        .cacheCuentas
        .indexWhere((cuenta) => cuenta.cuenta == cuentaAhorro);

    if (indexCuenta == -1) {
      throw Exception('No se encontró la cuenta $cuentaAhorro en el caché.');
    }

    // Obtener la cuenta desde el caché
    CuentaCacheStructStruct cuentaData = FFAppState().cacheCuentas[indexCuenta];
    print(
        'CALCULAR PPP, TAP y TAD: Cuenta encontrada en caché: ${cuentaData.cuenta}');

    // Extraer los campos ppp, tap y tad, asignar 0 si son null
    double ppp = cuentaData.ppp ?? 0.0;
    double tap = cuentaData.tap ?? 0.0;
    double tad = cuentaData.tad ?? 0.0;

    print(
        'CALCULAR PPP, TAP y TAD: Valores actuales - PPP: $ppp, TAP: $tap, TAD: $tad');

    // Calcular nuevoTap y nuevoTad usando montoAhorro proporcionado
    double nuevoTap = tap + montoAhorro;
    double nuevoTad = tad + montoDivisa;

    print(
        'CALCULAR PPP, TAP y TAD: nuevoTap = $nuevoTap, nuevoTad = $nuevoTad');

    // Calcular nuevoPPP, asignar 0 si nuevoTad es 0
    double nuevoPPP = 0.0;
    if (nuevoTad != 0) {
      nuevoPPP = nuevoTap / nuevoTad;
    } else {
      nuevoPPP = 0.0;
      print('CALCULAR PPP, TAP y TAD: nuevoTad es 0, asignando nuevoPPP = 0');
    }

    print('CALCULAR PPP, TAP y TAD: nuevoPPP = $nuevoPPP');

    // Actualizar los valores en Firebase
    // Obtener el ID de la cuenta
    String cuentaId = cuentaData.id;
    await FirebaseFirestore.instance
        .collection('Cuentas')
        .doc(cuentaId)
        .update({
      'ppp': nuevoPPP,
      'tap': nuevoTap,
      'tad': nuevoTad,
    });

    print('CALCULAR PPP, TAP y TAD: Datos actualizados en Firebase');

    // Actualizar los valores en el caché de FFAppState
    // Crear una nueva instancia de CuentaCacheStructStruct con los valores actualizados
    final cuentaActualizada = CuentaCacheStructStruct(
      id: cuentaData.id,
      cuenta: cuentaData.cuenta,
      logo: cuentaData.logo,
      activa: cuentaData.activa,
      ahorro: cuentaData.ahorro,
      divisa: cuentaData.divisa,
      ppp: nuevoPPP,
      tap: nuevoTap,
      tad: nuevoTad,
    );

    // Crear una nueva lista y asignarla a FFAppState
    final updatedCacheCuentas =
        List<CuentaCacheStructStruct>.from(FFAppState().cacheCuentas);
    updatedCacheCuentas[indexCuenta] = cuentaActualizada;
    FFAppState().cacheCuentas = updatedCacheCuentas;

    print('CALCULAR PPP, TAP y TAD: Caché de cuentas actualizado');
  } catch (e) {
    print('Error al calcular PPP, TAP y TAD: $e');
  }
}
