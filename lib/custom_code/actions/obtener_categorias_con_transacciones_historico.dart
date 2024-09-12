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

Future<List<String>> obtenerCategoriasConTransaccionesHistorico() async {
  List<String> categorias = ['Todas']; // Inicializar con "Todas"

  try {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('No hay usuario autenticado');
    }

    // Consultar todas las transacciones históricas filtradas por UID y tipo de movimiento
    QuerySnapshot transaccionesSnapshot = await FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('movimiento', whereIn: ['Gasto', 'gasto', 'Mixta']).get();

    for (var transDoc in transaccionesSnapshot.docs) {
      // Resolver la referencia de categoría
      DocumentReference categoriaRef = transDoc['categoria'];
      DocumentSnapshot categoriaDoc = await categoriaRef.get();
      String categoria = categoriaDoc['categoria'];

      if (!categorias.contains(categoria)) {
        categorias.add(categoria);
      }
    }

    // Guardar el resultado en la appstate categoriasHistorico
    FFAppState().categoriasHistorico = categorias;
    print('Categorías históricas: ${FFAppState().categoriasHistorico}');

    return categorias;
  } catch (e) {
    print('Error en la consulta a Firebase: $e');
    return [];
  }
}
