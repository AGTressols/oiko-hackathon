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

Future<void> guardarMesActualEnSeleccionPeriodos() async {
  try {
    // Obtener la fecha actual
    DateTime fechaActual = DateTime.now();

    // Mapeo de los meses en español
    List<String> meses = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre'
    ];

    // Obtener el nombre del mes actual
    String mesActual = meses[fechaActual.month - 1];

    // Guardar el mes actual en el AppState seleccionPeriodos
    FFAppState().seleccionPeriodos = [mesActual];

    print('Mes actual guardado: $mesActual');
  } catch (e) {
    print('Error al guardar el mes actual: $e');
  }
}
