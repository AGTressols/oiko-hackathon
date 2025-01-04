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

Future<void> procesarGraficoEtiqueta() async {
  try {
    print('PROCESAR GRÁFICO ETIQUETA: Iniciando función');

    // Obtener la categoría seleccionada desde la AppState
    String? categoriaSeleccionada =
        FFAppState().categoriasSeleccionadas.isNotEmpty
            ? FFAppState().categoriasSeleccionadas.first
            : null;
    if (categoriaSeleccionada == null) {
      print('PROCESAR GRÁFICO ETIQUETA: No hay categoría seleccionada');
      return;
    }

    print(
        'PROCESAR GRÁFICO ETIQUETA: Categoría seleccionada: $categoriaSeleccionada');

    // Obtener las transacciones de gasto desde FFAppState().transaccionesGasto
    List<TotalidadDeTransaccionesStruct> transaccionesGasto =
        FFAppState().transaccionesGasto;

    // Verificar que hay transacciones disponibles
    if (transaccionesGasto.isEmpty) {
      print(
          'PROCESAR GRÁFICO ETIQUETA: No hay transacciones de gasto disponibles.');
      return;
    }

    // Crear un mapa para almacenar los resultados
    Map<String, Map<String, double>> resultado = {};

    // Procesar las transacciones
    for (var transaccion in transaccionesGasto) {
      // Obtener la categoría de la transacción
      String categoriaNombre = transaccion.categoria ?? 'Sin categoría';

      // Filtrar por la categoría seleccionada
      if (categoriaNombre != categoriaSeleccionada) {
        print(
            'PROCESAR GRÁFICO ETIQUETA: Categoría $categoriaNombre descartada');
        continue;
      }

      if (!resultado.containsKey(categoriaNombre)) {
        resultado[categoriaNombre] = {};
      }

      // Obtener la etiqueta de la transacción
      String etiquetaNombre = transaccion.etiqueta ?? 'sin etiqueta';

      // Sumar el monto a la etiqueta correspondiente
      resultado[categoriaNombre]![etiquetaNombre] =
          (resultado[categoriaNombre]![etiquetaNombre] ?? 0.0) +
              (transaccion.monto ?? 0.0);
    }

    // Almacenar los detalles en el AppState
    FFAppState().graficoEtiquetaAppState = resultado.entries
        .expand((categoriaEntry) =>
            categoriaEntry.value.entries.map((etiquetaEntry) {
              return GraficoEtiquetaStruct(
                etiquetas: etiquetaEntry.key,
                gasto: etiquetaEntry.value,
              );
            }))
        .toList();

    print('PROCESAR GRÁFICO ETIQUETA: Datos almacenados en el AppState');
  } catch (e) {
    print('PROCESAR GRÁFICO ETIQUETA: Error: $e');
  }
}
