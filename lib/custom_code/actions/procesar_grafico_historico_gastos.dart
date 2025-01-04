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

import 'package:intl/intl.dart'; // Asegúrate de importar esto si no está ya

Future<void> procesarGraficoHistoricoGastos() async {
  try {
    print('PROCESAR GRÁFICO HISTÓRICO GASTOS: Iniciando función');

    // Leer las AppStates de categorías y etiquetas
    String categoriaSeleccionada =
        FFAppState().seleccionCategoriasHistorico.isNotEmpty
            ? FFAppState().seleccionCategoriasHistorico[0]
            : "Todas";
    String etiquetaSeleccionada =
        FFAppState().seleccionEtiquetasHistorico.isNotEmpty
            ? FFAppState().seleccionEtiquetasHistorico[0]
            : "Todas";

    print(
        'PROCESAR GRÁFICO HISTÓRICO GASTOS: Filtrando por categoría: $categoriaSeleccionada y etiqueta: $etiquetaSeleccionada');

    // Obtener las transacciones de gasto desde FFAppState().transaccionesGasto
    List<TotalidadDeTransaccionesStruct> transaccionesGasto =
        FFAppState().transaccionesGasto;

    // Verificar que hay transacciones disponibles
    if (transaccionesGasto.isEmpty) {
      print(
          'PROCESAR GRÁFICO HISTÓRICO GASTOS: No hay transacciones de gasto disponibles.');
      return;
    }

    // Mapa para almacenar los datos agrupados por periodo
    Map<String, double> gastosPorPeriodo = {};
    DateTime? minFecha;
    DateTime? maxFecha;

    for (var transaccion in transaccionesGasto) {
      // Filtrar según la categoría y etiqueta seleccionada
      String categoriaNombre = transaccion.categoria ?? "Sin categoría";
      String etiquetaNombre = transaccion.etiqueta ?? "Sin Etiqueta";

      if (categoriaSeleccionada != "Todas" &&
          categoriaNombre != categoriaSeleccionada) {
        continue;
      }
      if (etiquetaSeleccionada != "Todas" && etiquetaSeleccionada.isNotEmpty) {
        if (etiquetaNombre != etiquetaSeleccionada) {
          continue;
        }
      }

      // Obtener la fecha de la transacción
      if (transaccion.fecha == null || transaccion.fecha!.isEmpty) {
        continue;
      }
      DateTime fecha = DateTime.parse(transaccion.fecha!);
      DateTime fechaMes = DateTime(fecha.year, fecha.month);

      // Actualizar minFecha y maxFecha
      if (minFecha == null || fechaMes.isBefore(minFecha)) {
        minFecha = fechaMes;
      }
      if (maxFecha == null || fechaMes.isAfter(maxFecha)) {
        maxFecha = fechaMes;
      }

      String mes = DateFormat('MMM', 'es_ES').format(fecha);
      String mesCapitalizado = "${mes[0].toUpperCase()}${mes.substring(1)}";
      String periodo = "$mesCapitalizado ${fecha.year.toString().substring(2)}";

      // Sumar el monto al período correspondiente
      double monto = transaccion.monto ?? 0.0;
      gastosPorPeriodo[periodo] = (gastosPorPeriodo[periodo] ?? 0.0) + monto;
    }

    if (minFecha == null || maxFecha == null) {
      print(
          'PROCESAR GRÁFICO HISTÓRICO GASTOS: No hay fechas válidas en las transacciones.');
      return;
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

      // Avanzar al siguiente mes
      iteradorFecha = DateTime(
        iteradorFecha.month == 12 ? iteradorFecha.year + 1 : iteradorFecha.year,
        iteradorFecha.month % 12 + 1,
      );
    }

    // Guardar los datos en las AppStates
    FFAppState().nombreGraficoHistoricoGastos = categoriaSeleccionada != "Todas"
        ? categoriaSeleccionada
        : etiquetaSeleccionada;
    FFAppState().periodosGraficoHistoricoGastos = periodos;
    FFAppState().gastoGraficoHistoricoGastos = gastos;

    print(
        'PROCESAR GRÁFICO HISTÓRICO GASTOS: Datos almacenados en las AppStates:');
    print(
        'PROCESAR GRÁFICO HISTÓRICO GASTOS: Nombre: ${FFAppState().nombreGraficoHistoricoGastos}');
    print(
        'PROCESAR GRÁFICO HISTÓRICO GASTOS: Periodos: ${FFAppState().periodosGraficoHistoricoGastos}');
    print(
        'PROCESAR GRÁFICO HISTÓRICO GASTOS: Gastos: ${FFAppState().gastoGraficoHistoricoGastos}');
  } catch (e) {
    print('PROCESAR GRÁFICO HISTÓRICO GASTOS: Error: $e');
  }
}
