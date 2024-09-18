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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> procesarDatosDeCuentas() async {
  // Inicializar la lista para almacenar los datos de las cuentas de gastos e ingresos
  List<Map<String, dynamic>> listaGastosCuentas = [];
  List<Map<String, dynamic>> listaIngresosCuentas = [];

  try {
    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('No hay usuario autenticado');
    }

    // Obtener los períodos seleccionados desde el App State
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

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
    List<DateTime> startDates = seleccionPeriodos.map((mes) {
      int month = meses[mes]!;
      return DateTime(DateTime.now().year, month, 1);
    }).toList();

    List<DateTime> endDates = startDates.map((startDate) {
      return DateTime(startDate.year, startDate.month + 1, 0, 23, 59, 59);
    }).toList();

    // Variables para almacenar el gasto e ingreso total de todas las cuentas
    double gastoTotal = 0;
    double ingresoTotal = 0;

    // Iterar sobre cada rango de fechas y hacer la consulta para "Gasto"
    for (int i = 0; i < startDates.length; i++) {
      QuerySnapshot transaccionesSnapshot = await FirebaseFirestore.instance
          .collection('Transacciones')
          .where('uid', isEqualTo: uid)
          .where('movimiento', whereIn: ['Gasto', 'gasto'])
          .where('fecha', isGreaterThanOrEqualTo: startDates[i])
          .where('fecha', isLessThanOrEqualTo: endDates[i])
          .get();

      for (var doc in transaccionesSnapshot.docs) {
        // Convertir el monto a double si es necesario
        double monto = (doc['monto'] is int)
            ? (doc['monto'] as int).toDouble()
            : doc['monto'];

        DocumentReference cuentaRef = doc['cuenta'];

        // Obtener el nombre y el logo de la cuenta
        DocumentSnapshot cuentaSnapshot = await cuentaRef.get();
        String nombreCuenta = cuentaSnapshot['cuenta'];
        String logoCuenta = cuentaSnapshot['logo'];

        // Buscar si la cuenta ya está en la lista
        var cuentaExistente = listaGastosCuentas.firstWhere(
          (gastoCuenta) => gastoCuenta['cuenta'] == nombreCuenta,
          orElse: () => {},
        );

        if (cuentaExistente.isEmpty) {
          // Si la cuenta no existe, agregar un nuevo objeto a la lista
          listaGastosCuentas.add({
            'cuenta': nombreCuenta,
            'logo': logoCuenta,
            'monto': monto,
            'restoMonto': 0,
          });
        } else {
          // Si la cuenta ya existe, sumar el monto al total existente
          cuentaExistente['monto'] += monto;
        }

        // Sumar el monto al gasto total
        gastoTotal += monto;
      }
    }

    // Calcular el resto de gasto por cada cuenta
    for (var gastoCuenta in listaGastosCuentas) {
      gastoCuenta['restoMonto'] = gastoTotal - gastoCuenta['monto'];
    }

    // Guardar los detalles de gastos en la App State
    FFAppState().gastosPorCuenta = listaGastosCuentas
        .map((e) => GastosCuentasStruct(
              cuenta: e['cuenta'] as String,
              logo: e['logo'] as String,
              monto: e['monto'] as double,
              restoMonto: e['restoMonto'] as double,
            ))
        .toList();

    // Iterar sobre cada rango de fechas y hacer la consulta para "Ingreso"
    for (int i = 0; i < startDates.length; i++) {
      QuerySnapshot transaccionesSnapshot = await FirebaseFirestore.instance
          .collection('Transacciones')
          .where('uid', isEqualTo: uid)
          .where('movimiento', whereIn: ['Ingreso', 'ingreso'])
          .where('fecha', isGreaterThanOrEqualTo: startDates[i])
          .where('fecha', isLessThanOrEqualTo: endDates[i])
          .get();

      for (var doc in transaccionesSnapshot.docs) {
        // Convertir el monto a double si es necesario
        double monto = (doc['monto'] is int)
            ? (doc['monto'] as int).toDouble()
            : doc['monto'];

        DocumentReference cuentaRef = doc['cuenta'];

        // Obtener el nombre y el logo de la cuenta
        DocumentSnapshot cuentaSnapshot = await cuentaRef.get();
        String nombreCuenta = cuentaSnapshot['cuenta'];
        String logoCuenta = cuentaSnapshot['logo'];

        // Buscar si la cuenta ya está en la lista
        var cuentaExistente = listaIngresosCuentas.firstWhere(
          (ingresoCuenta) => ingresoCuenta['cuenta'] == nombreCuenta,
          orElse: () => {},
        );

        if (cuentaExistente.isEmpty) {
          // Si la cuenta no existe, agregar un nuevo objeto a la lista
          listaIngresosCuentas.add({
            'cuenta': nombreCuenta,
            'logo': logoCuenta,
            'monto': monto,
            'restoMonto': 0,
          });
        } else {
          // Si la cuenta ya existe, sumar el monto al total existente
          cuentaExistente['monto'] += monto;
        }

        // Sumar el monto al ingreso total
        ingresoTotal += monto;
      }
    }

    // Calcular el resto de ingreso por cada cuenta
    for (var ingresoCuenta in listaIngresosCuentas) {
      ingresoCuenta['restoMonto'] = ingresoTotal - ingresoCuenta['monto'];
    }

    // Guardar los detalles de ingresos en la App State
    FFAppState().ingresosPorCuenta = listaIngresosCuentas
        .map((e) => GastosCuentasStruct(
              cuenta: e['cuenta'] as String,
              logo: e['logo'] as String,
              monto: e['monto'] as double,
              restoMonto: e['restoMonto'] as double,
            ))
        .toList();
  } catch (e) {
    print('Error en la consulta a Firebase: $e');
  }
}
