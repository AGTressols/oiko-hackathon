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
import 'dart:math';

Future<void> procesarDatosGraficoIngresoPorCategoria() async {
  // Inicializar la lista para almacenar los datos de las categorías
  List<Map<String, dynamic>> listaGraficoIngreso = [];
  double totalIngreso = 0.0;

  try {
    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('No hay usuario autenticado');
    }

    // Obtener los períodos seleccionados desde la App State
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

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

    // Consultar las transacciones filtradas por UID, Movimiento y Fecha (Ingreso)
    QuerySnapshot transaccionesSnapshot = await FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('movimiento', whereIn: ['Ingreso', 'ingreso']).get();

    // Crear un mapa para agrupar las transacciones por categoría
    Map<String, Map<String, dynamic>> categoriasData = {};

    for (var transDoc in transaccionesSnapshot.docs) {
      DateTime fecha = (transDoc['fecha'] as Timestamp).toDate();

      // Verificar si la transacción está dentro de alguno de los rangos de fechas seleccionados
      bool dentroDeRango = false;
      for (var rango in rangosDeFechas) {
        if (fecha.isAfter(rango['inicio']!) && fecha.isBefore(rango['fin']!)) {
          dentroDeRango = true;
          break;
        }
      }
      if (!dentroDeRango) continue;

      // Resolver la referencia de la categoría
      DocumentReference categoriaRef = transDoc['categoria'];
      DocumentSnapshot categoriaDoc = await categoriaRef.get();
      String categoria = categoriaDoc['categoria'];
      double monto = double.tryParse(transDoc['monto'].toString()) ?? 0.0;

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
    }

    // Calcular el porcentaje de ingreso por categoría y la altura gráfica
    categoriasData.forEach((categoria, data) {
      double porcentajeIngreso = (data['ingresoAbs'] / totalIngreso);
      int heightInPx = (porcentajeIngreso * 400).toInt();

      // Seleccionar un color aleatorio de la constante "colores" creada en FlutterFlow
      List<Color> colores = FFAppState().colores; // Acceso a la constante
      int randomIndex = Random().nextInt(colores.length);
      Color colorAleatorio = colores[randomIndex];

      listaGraficoIngreso.add({
        'categoria': data['categoria'],
        'ingresoAbs': data['ingresoAbs'].toInt(),
        'porcentajeIngreso': porcentajeIngreso,
        'ingresoPx': heightInPx,
        'color': colorAleatorio, // Asignar el color aleatorio
      });
    });

    // Almacenar los detalles en la App State
    FFAppState().graficoIngresoPorCategoria = listaGraficoIngreso
        .map((e) => GraficoCategoriasIngresoStruct(
              categoria: e['categoria'] as String,
              ingresoPorCategoriaAbs: e['ingresoAbs'] as double,
              porcentajeIngresoPorCategoria: e['porcentajeIngreso'] as double,
              ingresoPorCategoriaPX: e['ingresoPx'] as int,
              color: e['color'] as Color, // Asignar el color aleatorio
            ))
        .toList();

    print(
        'Datos almacenados en la App State: ${FFAppState().graficoIngresoPorCategoria}');
  } catch (e) {
    print('Error en la consulta a Firebase: $e');
  }
}
