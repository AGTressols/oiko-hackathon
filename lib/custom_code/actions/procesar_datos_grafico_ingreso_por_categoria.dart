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

import 'dart:math';

Future<void> procesarDatosGraficoIngresoPorCategoria() async {
  // Inicializar la lista para almacenar los datos de las categorías
  List<Map<String, dynamic>> listaGraficoIngreso = [];
  double totalIngreso = 0.0;

  try {
    print('PROCESAR DATOS GRAFICO INGRESO POR CATEGORIA: Iniciando función');

    // Obtener los períodos seleccionados desde la App State
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

    // Verificar que hay períodos seleccionados
    if (seleccionPeriodos.isEmpty) {
      print(
          'PROCESAR DATOS GRAFICO INGRESO POR CATEGORIA: No hay períodos seleccionados.');
      return;
    }

    // Mapear los nombres de meses a números de meses
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

    // Convertir los períodos seleccionados a rangos de fechas
    List<Map<String, DateTime>> rangosDeFechas = [];

    for (String mesAnio in seleccionPeriodos) {
      // Ajuste para manejar 'Mes' o 'Mes Año'
      List<String> partes = mesAnio.split(' ');

      String mesTexto;
      int year;

      if (partes.length == 2) {
        // Formato 'Mes Año'
        mesTexto = partes[0];
        year = int.tryParse(partes[1]) ?? DateTime.now().year;
      } else if (partes.length == 1) {
        // Formato 'Mes' - Asumimos el año actual
        mesTexto = partes[0];
        year = DateTime.now().year;
      } else {
        print(
            'PROCESAR DATOS GRAFICO INGRESO POR CATEGORIA: Formato de mes inválido: $mesAnio');
        continue;
      }

      int? mesNumero = meses[mesTexto];

      if (mesNumero == null) {
        print(
            'PROCESAR DATOS GRAFICO INGRESO POR CATEGORIA: Mes inválido: $mesTexto');
        continue;
      }

      DateTime inicio = DateTime(year, mesNumero, 1);
      DateTime fin;
      if (mesNumero == 12) {
        fin = DateTime(year + 1, 1, 0, 23, 59, 59);
      } else {
        fin = DateTime(year, mesNumero + 1, 0, 23, 59, 59);
      }

      rangosDeFechas.add({'inicio': inicio, 'fin': fin});
    }

    // Verificar que tenemos al menos un rango de fechas válido
    if (rangosDeFechas.isEmpty) {
      print(
          'PROCESAR DATOS GRAFICO INGRESO POR CATEGORIA: No se pudieron obtener rangos de fechas válidos.');
      return;
    }

    // Obtener las transacciones de ingreso desde FFAppState().transaccionesIngreso
    List<TotalidadDeTransaccionesStruct> transaccionesIngreso =
        FFAppState().transaccionesIngreso;

    // Crear un mapa para agrupar las transacciones por categoría
    Map<String, Map<String, dynamic>> categoriasData = {};

    for (var transaccion in transaccionesIngreso) {
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
          double monto = transaccion.monto ?? 0.0;

          // Sumar el monto al total de ingresos
          totalIngreso += monto;

          // Si la categoría ya existe en el mapa, actualizar los valores
          if (categoriasData.containsKey(categoria)) {
            categoriasData[categoria]!['ingresoAbs'] += monto;
          } else {
            // Si no existe, crear una nueva entrada en el mapa
            categoriasData[categoria] = {
              'categoria': categoria,
              'ingresoAbs': monto,
            };
          }
        } catch (e) {
          print(
              'PROCESAR DATOS GRAFICO INGRESO POR CATEGORIA: Error al procesar transacción: $e');
          continue;
        }
      }
    }

    // Verificar que totalIngreso no sea cero para evitar división por cero
    if (totalIngreso == 0.0) {
      print(
          'PROCESAR DATOS GRAFICO INGRESO POR CATEGORIA: El total de ingresos es cero.');
      return;
    }

    // Calcular el porcentaje de ingreso por categoría y la altura gráfica
    categoriasData.forEach((categoria, data) {
      double ingresoAbs = data['ingresoAbs'];
      double porcentajeIngreso = ingresoAbs / totalIngreso;
      int heightInPx = (porcentajeIngreso * 350).toInt();

      // Seleccionar un color aleatorio de la constante "colores" creada en FlutterFlow
      List<Color> colores = FFAppState().colores; // Acceso a la constante
      int randomIndex = Random().nextInt(colores.length);
      Color colorAleatorio = colores[randomIndex];

      listaGraficoIngreso.add({
        'categoria': categoria,
        'ingresoAbs': ingresoAbs,
        'porcentajeIngreso': porcentajeIngreso,
        'ingresoPx': heightInPx,
        'color': colorAleatorio,
      });
    });

    // Almacenar los detalles en la App State
    FFAppState().graficoIngresoPorCategoria = listaGraficoIngreso
        .map((e) => GraficoCategoriasIngresoStruct(
              categoria: e['categoria'] as String,
              ingresoPorCategoriaAbs: e['ingresoAbs'] as double,
              porcentajeIngresoPorCategoria: e['porcentajeIngreso'] as double,
              ingresoPorCategoriaPX: e['ingresoPx'] as int,
              color: e['color'] as Color,
            ))
        .toList();

    print(
        'PROCESAR DATOS GRAFICO INGRESO POR CATEGORIA: Datos almacenados en la App State.');
  } catch (e) {
    print('PROCESAR DATOS GRAFICO INGRESO POR CATEGORIA: Error: $e');
  }
}
