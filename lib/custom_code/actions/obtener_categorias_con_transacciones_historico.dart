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

import '/backend/schema/structs/index.dart'; // Asegúrate de que este import incluye los structs necesarios
import '/flutter_flow/flutter_flow_util.dart'; // Asegúrate de que FFAppState está definido aquí

Future<List<String>> obtenerCategoriasConTransaccionesHistorico() async {
  // Inicializar la lista de categorías con "Todas"
  Set<String> categoriasSet = {'Todas'};

  try {
    print('OBTENER CAT CON TRANS HISTORICO: Iniciando proceso.');

    // Obtener las categorías desde el cacheCategorias en FFAppState
    List<CategoriasCacheStructStruct> cacheCategorias =
        FFAppState().cacheCategorias;

    // Verificar que hay categorías en el caché
    if (cacheCategorias.isEmpty) {
      print(
          'OBTENER CAT CON TRANS HISTORICO: No hay categorías en cacheCategorias.');
      FFAppState().categoriasHistorico = categoriasSet.toList();
      return categoriasSet.toList();
    }

    // Iterar sobre cacheCategorias y agregar las categorías con movimiento "Gasto"
    for (var categoria in cacheCategorias) {
      String? movimiento = categoria.movimiento;
      String? nombreCategoria = categoria.categoria;

      if (movimiento != null &&
          nombreCategoria != null &&
          movimiento.toLowerCase() == 'gasto') {
        categoriasSet.add(nombreCategoria);
      }
    }

    // Asignar la lista de categorías a la AppState
    FFAppState().categoriasHistorico = categoriasSet.toList();
    print(
        'OBTENER CAT CON TRANS HISTORICO: Categorías históricas actualizadas: ${FFAppState().categoriasHistorico}');

    return FFAppState().categoriasHistorico;
  } catch (e) {
    print('OBTENER CAT CON TRANS HISTORICO: Error en el procesamiento: $e');
    // En caso de error, asignar una lista con solo "Todas"
    FFAppState().categoriasHistorico = ['Todas'];
    return ['Todas'];
  }
}
