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

// Importaciones necesarias
import '/backend/schema/structs/index.dart'; // Asegúrate de que este import incluye los structs necesarios
import '/flutter_flow/flutter_flow_util.dart'; // Asegúrate de que FFAppState está definido aquí

Future<void> obtenerEtiquetasHistorico() async {
  try {
    // Obtener la categoría seleccionada desde la appstate en el índice 0
    String? categoriaSeleccionada =
        FFAppState().seleccionCategoriasHistorico.isNotEmpty
            ? FFAppState().seleccionCategoriasHistorico[0]
            : null;
    if (categoriaSeleccionada == null) {
      throw Exception(
          'ETIQUETAS HISTORICO: No hay categoría seleccionada en la appstate');
    }

    // Lista para almacenar las etiquetas
    Set<String> etiquetasHistorico = {'Todas'}; // Inicializar con "Todas"

    // Obtener el ID de la categoría seleccionada desde cacheCategorias
    String? categoriaSeleccionadaId;
    for (var categoria in FFAppState().cacheCategorias) {
      if (categoria.categoria == categoriaSeleccionada) {
        categoriaSeleccionadaId = categoria.id;
        break;
      }
    }
    if (categoriaSeleccionadaId == null) {
      throw Exception(
          'ETIQUETAS HISTORICO: No se encontró el ID de la categoría seleccionada');
    }

    // Iterar sobre cacheEtiquetas y agregar las que pertenecen a la categoría seleccionada
    for (var etiqueta in FFAppState().cacheEtiquetas) {
      if (etiqueta.categoria != null) {
        String etiquetaCategoriaId = etiqueta.categoria!.id;
        if (etiquetaCategoriaId == categoriaSeleccionadaId) {
          String etiquetaNombre = etiqueta.etiqueta ?? 'Sin Etiqueta';
          etiquetasHistorico.add(etiquetaNombre);
        }
      }
    }

    // Guardar la lista de etiquetas en la appstate etiquetasHistorico
    FFAppState().etiquetasHistorico = etiquetasHistorico.toList();

    print(
        'ETIQUETAS HISTORICO: Etiquetas históricas guardadas en la App State: ${FFAppState().etiquetasHistorico}');
  } catch (e) {
    print('ETIQUETAS HISTORICO: Error al procesar las etiquetas: $e');
  }
}
