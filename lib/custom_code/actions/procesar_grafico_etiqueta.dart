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

Future<void> procesarGraficoEtiqueta() async {
  try {
    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('No hay usuario autenticado');
    }

    // Obtener la categoría seleccionada desde la appstate
    String? categoriaSeleccionada =
        FFAppState().categoriasSeleccionadas.isNotEmpty
            ? FFAppState().categoriasSeleccionadas.first
            : null;
    if (categoriaSeleccionada == null) {
      throw Exception('No hay categoría seleccionada');
    }

    print('grafico etiquetas: Categoría seleccionada: $categoriaSeleccionada');

    // Consultar las transacciones filtradas por UID y movimiento "Gasto"
    QuerySnapshot transaccionesSnapshot = await FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('movimiento', whereIn: ['Gasto', 'gasto']).get();

    Map<String, Map<String, double>> resultado = {};

    for (var transDoc in transaccionesSnapshot.docs) {
      final data = transDoc.data() as Map<String, dynamic>;

      // Resolver la referencia de categoría
      DocumentReference categoriaRef = data['categoria'];
      DocumentSnapshot categoriaDoc = await categoriaRef.get();
      String categoriaNombre =
          categoriaDoc.exists ? categoriaDoc['categoria'] : "Sin categoría";

      print('grafico etiquetas: Categoría encontrada: $categoriaNombre');

      // Filtrar por la categoría seleccionada
      if (categoriaNombre != categoriaSeleccionada) {
        print('grafico etiquetas: Categoría $categoriaNombre descartada');
        continue;
      }

      if (!resultado.containsKey(categoriaNombre)) {
        resultado[categoriaNombre] = {};
      }

      // Resolver la referencia de etiqueta o asignar "sin etiqueta" si la referencia es un string vacío
      String etiquetaNombre = "sin etiqueta";
      if (data['etiqueta'] != null && data['etiqueta'] is DocumentReference) {
        DocumentReference etiquetaRef = data['etiqueta'];
        DocumentSnapshot etiquetaDoc = await etiquetaRef.get();
        etiquetaNombre =
            etiquetaDoc.exists ? etiquetaDoc['etiqueta'] : "sin etiqueta";
      }

      print('grafico etiquetas: Etiqueta encontrada: $etiquetaNombre');

      // Sumar el monto a la etiqueta correspondiente
      resultado[categoriaNombre]![etiquetaNombre] =
          (resultado[categoriaNombre]![etiquetaNombre] ?? 0.0) +
              (data['monto'] ?? 0.0);
    }

    // Almacenar los detalles en la App State
    FFAppState().graficoEtiquetaAppState = resultado.entries
        .expand((categoriaEntry) => categoriaEntry.value.entries
            .map((etiquetaEntry) => GraficoEtiquetaStruct(
                  etiquetas: etiquetaEntry.key,
                  gasto: etiquetaEntry.value,
                )))
        .toList();

    print(
        'grafico etiquetas: Datos almacenados en la App State: ${FFAppState().graficoEtiquetaAppState}');
  } catch (e) {
    print('grafico etiquetas: Error en la consulta a Firebase: $e');
  }
}
