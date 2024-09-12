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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart'; // Asegúrate de importar esto si no está ya

Future<void> procesarGraficoHistoricoGastos() async {
  try {
    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('No hay usuario autenticado');
    }

    // Leer las appstates de categorías y etiquetas
    String categoriaSeleccionada =
        FFAppState().seleccionCategoriasHistorico.isNotEmpty
            ? FFAppState().seleccionCategoriasHistorico[0]
            : "Todas";
    String etiquetaSeleccionada =
        FFAppState().seleccionEtiquetasHistorico.isNotEmpty
            ? FFAppState().seleccionEtiquetasHistorico[0]
            : "Todas";

    print(
        'Filtrando por categoría: $categoriaSeleccionada y etiqueta: $etiquetaSeleccionada');

    // Consultar las transacciones filtradas por UID y tipo de movimiento
    QuerySnapshot transaccionesSnapshot = await FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('movimiento', whereIn: ['Gasto', 'gasto', 'Mixta']).get();

    // Mapa para almacenar los datos agrupados por periodo y categoría
    Map<String, double> gastosPorPeriodo = {};
    DateTime minFecha = DateTime.now();
    DateTime maxFecha = DateTime.now();

    for (var transDoc in transaccionesSnapshot.docs) {
      final data = transDoc.data() as Map<String, dynamic>;

      // Resolver la referencia de categoría
      DocumentReference categoriaRef = data['categoria'];
      DocumentSnapshot categoriaDoc = await categoriaRef.get();
      String categoriaNombre =
          categoriaDoc.exists ? categoriaDoc['categoria'] : "Sin categoría";

      // Resolver la referencia de etiqueta o asignar "sin etiqueta" si la referencia es un string vacío
      String etiquetaNombre = "Sin Etiqueta";
      if (data['etiqueta'] != null && data['etiqueta'] is DocumentReference) {
        DocumentReference etiquetaRef = data['etiqueta'];
        DocumentSnapshot etiquetaDoc = await etiquetaRef.get();
        etiquetaNombre =
            etiquetaDoc.exists ? etiquetaDoc['etiqueta'] : "Sin Etiqueta";
      }

      // Filtrar según la categoría y etiqueta seleccionada
      if (categoriaSeleccionada != "Todas" &&
          categoriaNombre != categoriaSeleccionada) {
        continue;
      }
      if (etiquetaSeleccionada != "Todas" && etiquetaSeleccionada.isNotEmpty) {
        if (etiquetaNombre != etiquetaSeleccionada) {
          continue;
        }
      }

      // Obtener el período (mes y año) de la transacción
      DateTime fecha = (data['fecha'] as Timestamp).toDate();
      if (fecha.isBefore(minFecha)) {
        minFecha = DateTime(fecha.year, fecha.month);
      }
      if (fecha.isAfter(maxFecha)) {
        maxFecha = DateTime(fecha.year, fecha.month);
      }

      String mes = DateFormat('MMM', 'es_ES').format(fecha);
      String mesCapitalizado = "${mes[0].toUpperCase()}${mes.substring(1)}";
      String periodo = "$mesCapitalizado ${fecha.year.toString().substring(2)}";

      // Sumar el monto al período correspondiente
      gastosPorPeriodo[periodo] =
          (gastosPorPeriodo[periodo] ?? 0.0) + (data['monto'] ?? 0.0);
    }

    // Asegurar que todos los meses desde minFecha hasta maxFecha estén en el mapa
    List<String> periodos = [];
    List<double> gastos = [];
    DateTime iteradorFecha = minFecha;

    while (iteradorFecha.isBefore(maxFecha) ||
        iteradorFecha.isAtSameMomentAs(maxFecha)) {
      String mes = DateFormat('MMM', 'es_ES').format(iteradorFecha);
      String mesCapitalizado = "${mes[0].toUpperCase()}${mes.substring(1)}";
      String periodo =
          "$mesCapitalizado ${iteradorFecha.year.toString().substring(2)}";

      periodos.add(periodo);
      gastos.add(gastosPorPeriodo[periodo] ?? 0.0);

      iteradorFecha = DateTime(iteradorFecha.year, iteradorFecha.month + 1);
    }

    // Guardar los datos en las AppStates
    FFAppState().nombreGraficoHistoricoGastos = categoriaSeleccionada != "Todas"
        ? categoriaSeleccionada
        : etiquetaSeleccionada;
    FFAppState().periodosGraficoHistoricoGastos = periodos;
    FFAppState().gastoGraficoHistoricoGastos = gastos;

    print('Datos almacenados en las App States:');
    print('Nombre: ${FFAppState().nombreGraficoHistoricoGastos}');
    print('Periodos: ${FFAppState().periodosGraficoHistoricoGastos}');
    print('Gastos: ${FFAppState().gastoGraficoHistoricoGastos}');
  } catch (e) {
    print('Error en la consulta a Firebase: $e');
  }
}
