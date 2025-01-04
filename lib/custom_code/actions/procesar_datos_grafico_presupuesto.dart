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

import 'dart:math';

Future<void> procesarDatosGraficoPresupuesto() async {
  // Inicializar la lista para almacenar los datos de las categorías
  List<Map<String, dynamic>> listaGraficoPresupuesto = [];

  try {
    // Obtener los períodos seleccionados desde la App State
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

    // Verificar que hay períodos seleccionados
    if (seleccionPeriodos.isEmpty) {
      print('No hay períodos seleccionados.');
      return;
    }

    // Convertir los períodos seleccionados en rangos de fechas
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

    // Crear un mapa para agrupar las transacciones por categoría
    Map<String, Map<String, dynamic>> categoriasData = {};

    // Obtener las transacciones de tipo 'Gasto' desde FFAppState
    List<TotalidadDeTransaccionesStruct> transaccionesGasto =
        FFAppState().transaccionesGasto;

    for (var transaccion in transaccionesGasto) {
      // Parsear la fecha de la transacción
      if (transaccion.fecha != null && transaccion.fecha!.isNotEmpty) {
        try {
          DateTime fechaTransaccion = DateTime.parse(transaccion.fecha!);

          // Verificar si la transacción está dentro de alguno de los rangos de fechas seleccionados
          bool dentroDeRango = false;
          for (var rango in rangosDeFechas) {
            if (fechaTransaccion.isAfter(
                    rango['inicio']!.subtract(Duration(milliseconds: 1))) &&
                fechaTransaccion
                    .isBefore(rango['fin']!.add(Duration(milliseconds: 1)))) {
              dentroDeRango = true;
              break;
            }
          }
          if (!dentroDeRango) continue;

          // Obtener la categoría de la transacción
          String categoria = transaccion.categoria ?? 'Sin Categoría';

          // Obtener los datos de la categoría desde el caché
          CategoriasCacheStructStruct? categoriaData;
          for (var c in FFAppState().cacheCategorias) {
            if (c.categoria == categoria) {
              categoriaData = c;
              break;
            }
          }

          if (categoriaData == null) {
            print('No se encontró la categoría "$categoria" en el caché.');
            continue;
          }

          String logo = categoriaData.logo ?? '';
          double presupuesto = categoriaData.presupuesto ?? 0.0;
          double monto = transaccion.monto ?? 0.0;

          // Si la categoría ya existe en el mapa, actualizar los valores
          if (categoriasData.containsKey(categoria)) {
            categoriasData[categoria]!['gastadoAbs'] += monto;
          } else {
            // Si no existe, crear una nueva entrada en el mapa
            categoriasData[categoria] = {
              'categoria': categoria,
              'logo': logo,
              'gastadoAbs': monto,
              'presupuesto': presupuesto,
            };
          }
        } catch (e) {
          print('Error al parsear la fecha de la transacción: $e');
          continue;
        }
      }
    }

    // Calcular el presupuesto disponible y el presupuesto gráfico para cada categoría
    categoriasData.forEach((categoria, data) {
      double presupuestoAjustado =
          data['presupuesto'] * seleccionPeriodos.length;
      double gastadoAbs = data['gastadoAbs'];
      double presupuestoDisponible = presupuestoAjustado - gastadoAbs;

      // *** MODIFICACIÓN SOLICITADA ***
      // Si el presupuesto es igual a 0, disponible es 0
      if (data['presupuesto'] == 0.0) {
        presupuestoDisponible = 0.0;
      }

      if (presupuestoAjustado < 1) {
        presupuestoAjustado = 1;
      }

      // Calcular el porcentaje del gasto sobre el presupuesto ajustado
      double porcentajeGrafico = (gastadoAbs / presupuestoAjustado);

      // Multiplicar el porcentaje por 235 px para obtener el valor en píxeles
      int widthInPx = (porcentajeGrafico * 235).toInt();

      // Asegurar que el widthInPx no exceda 235
      widthInPx = widthInPx.clamp(0, 235);

      // Seleccionar un color aleatorio de la lista de colores almacenada en AppState
      List<Color> colores = FFAppState().colores;
      int randomIndex = Random().nextInt(colores.length);
      Color colorAleatorio = colores[randomIndex];

      listaGraficoPresupuesto.add({
        'categoria': data['categoria'],
        'logo': data['logo'],
        'gastadoAbs': gastadoAbs.toInt(),
        'presupuestoDisponible': presupuestoDisponible.toInt(),
        'presupuestoGrafico': widthInPx,
        'color': colorAleatorio,
      });
    });

    // Almacenar los detalles en la App State
    FFAppState().graficoPresupuestoAppState = listaGraficoPresupuesto
        .map((e) => GraficoPresupuestoStruct(
              categoria: e['categoria'] as String,
              logo: e['logo'] as String,
              gastadoAbs: e['gastadoAbs'] as int,
              presupuestoDisponible: e['presupuestoDisponible'] as int,
              presupuestoGrafico: e['presupuestoGrafico'] as int,
              color: e['color'] as Color,
            ))
        .toList();

    print(
        'GRAFICO GASTO PRESUPUESTO: Datos almacenados en la App State: ${FFAppState().graficoPresupuestoAppState}');
  } catch (e) {
    print('GRAFICO GASTO PRESUPUESTO: Error al procesar los datos: $e');
  }
}
