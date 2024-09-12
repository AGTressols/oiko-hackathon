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

Future<double> calcularGastosTotales() async {
  double totalGastos = 0.0;

  try {
    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return -1.0; // Retorna un valor negativo o de error en caso de que no haya usuario autenticado
    }

    // Acceder al estado de la aplicación para obtener los períodos seleccionados
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

    // Convertir los meses seleccionados a rangos de fechas
    List<Map<String, DateTime>> convertirMesesARangos(
        List<String> mesesSeleccionados) {
      List<Map<String, DateTime>> rangosDeFechas = [];

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

      for (String mes in mesesSeleccionados) {
        int year = DateTime.now().year; // O usar el año que desees
        int mesNumero = meses[mes]!;
        DateTime inicio = DateTime(year, mesNumero, 1);
        DateTime fin =
            DateTime(year, mesNumero + 1, 0, 23, 59, 59); // Último día del mes
        rangosDeFechas.add({'inicio': inicio, 'fin': fin});
      }

      return rangosDeFechas;
    }

    // Convertir los meses seleccionados a rangos de fechas
    List<Map<String, DateTime>> rangosDeFechas =
        convertirMesesARangos(seleccionPeriodos);

    // Realizar las consultas a Firebase para cada rango de fechas
    for (var rango in rangosDeFechas) {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Transacciones')
          .where('movimiento', whereIn: ['Gasto', 'gasto'])
          .where('uid', isEqualTo: uid)
          .where('fecha', isGreaterThanOrEqualTo: rango['inicio'])
          .where('fecha', isLessThanOrEqualTo: rango['fin'])
          .get();

      for (var doc in querySnapshot.docs) {
        totalGastos += doc['monto'];
      }
    }

    // Forzar actualización en la App State con un valor numérico
    FFAppState().gastoTotalVariable = totalGastos;

    // Retornar el total de gastos como un valor double
    return totalGastos;
  } catch (e) {
    // Manejar el error y asignar el mensaje a la App State
    FFAppState().gastoTotalVariable =
        -1.0; // Retorna un valor negativo en caso de error
    return -1.0;
  }
}
