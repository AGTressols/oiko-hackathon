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

Future<void> obtenerEtiquetasHistorico() async {
  try {
    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('No hay usuario autenticado');
    }

    // Obtener la categoría seleccionada desde la appstate en el índice 0
    String? categoriaSeleccionada =
        FFAppState().seleccionCategoriasHistorico.isNotEmpty
            ? FFAppState().seleccionCategoriasHistorico[0]
            : null;
    if (categoriaSeleccionada == null) {
      throw Exception('No hay categoría seleccionada en la appstate');
    }

    // Consultar las transacciones del usuario con tipo de movimiento "gasto", "Gasto" o "Mixta"
    QuerySnapshot transaccionesSnapshot = await FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('movimiento', whereIn: ['Gasto', 'gasto', 'Mixta']).get();

    // Lista para almacenar las etiquetas
    List<String> etiquetasHistorico = ['Todas']; // Inicializar con "Todas"

    for (var transDoc in transaccionesSnapshot.docs) {
      final data = transDoc.data() as Map<String, dynamic>;

      // Resolver la referencia de la categoría
      DocumentReference categoriaRef = data['categoria'];
      DocumentSnapshot categoriaDoc = await categoriaRef.get();
      String categoriaNombre =
          categoriaDoc.exists ? categoriaDoc['categoria'] : "Sin categoría";

      // Verificar si la categoría coincide con la seleccionada
      if (categoriaNombre != categoriaSeleccionada) continue;

      // Resolver la referencia de la etiqueta o asignar "Sin Etiqueta"
      String etiquetaNombre = "Sin Etiqueta";
      if (data['etiqueta'] != null && data['etiqueta'] is DocumentReference) {
        DocumentReference etiquetaRef = data['etiqueta'];
        DocumentSnapshot etiquetaDoc = await etiquetaRef.get();
        etiquetaNombre =
            etiquetaDoc.exists ? etiquetaDoc['etiqueta'] : "Sin Etiqueta";
      }

      // Agregar la etiqueta a la lista si no está ya incluida
      if (!etiquetasHistorico.contains(etiquetaNombre)) {
        etiquetasHistorico.add(etiquetaNombre);
      }
    }

    // Guardar la lista de etiquetas en la appstate etiquetasHistorico
    FFAppState().etiquetasHistorico = etiquetasHistorico;

    print(
        'Etiquetas históricas guardadas en la App State: ${FFAppState().etiquetasHistorico}');
  } catch (e) {
    print('Error en la consulta a Firebase: $e');
  }
}
