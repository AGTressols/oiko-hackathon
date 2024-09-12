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

Future<List<String>> obtenerCategoriasConTransacciones() async {
  List<String> categorias = [];

  try {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('No hay usuario autenticado');
    }

    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

    List<Map<String, DateTime>> rangosDeFechas = seleccionPeriodos.map((mes) {
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
      int month = meses[mes]!;
      int year = DateTime.now().year;
      return {
        'inicio': DateTime(year, month, 1),
        'fin': DateTime(year, month + 1, 0, 23, 59, 59)
      };
    }).toList();

    QuerySnapshot transaccionesSnapshot = await FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('movimiento', whereIn: ['Gasto', 'gasto', 'Mixta']).get();

    for (var transDoc in transaccionesSnapshot.docs) {
      DateTime fecha = (transDoc['fecha'] as Timestamp).toDate();

      bool dentroDeRango = rangosDeFechas.any((rango) =>
          fecha.isAfter(rango['inicio']!) && fecha.isBefore(rango['fin']!));
      if (!dentroDeRango) continue;

      DocumentReference categoriaRef = transDoc['categoria'];
      DocumentSnapshot categoriaDoc = await categoriaRef.get();
      String categoria = categoriaDoc['categoria'];

      if (!categorias.contains(categoria)) {
        categorias.add(categoria);
      }
    }

    FFAppState().seleccionCategorias = categorias;
    print('Categorías con transacciones: ${FFAppState().seleccionCategorias}');

    return categorias; // Intento de retornar el listado
  } catch (e) {
    print('Error en la consulta a Firebase: $e');
    return []; // Retornar un listado vacío en caso de error
  }
}
