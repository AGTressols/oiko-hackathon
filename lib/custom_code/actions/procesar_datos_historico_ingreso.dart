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
import 'dart:math'; // Para el uso de Random()

Future<void> procesarDatosHistoricoIngreso() async {
  // Inicializar las listas para guardar datos
  List<Map<String, dynamic>> listaMesesHistorico = [];
  List<Map<String, dynamic>> listaCategoriasHistorico = [];
  double mayorIngreso = 0.0;

  try {
    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('No hay usuario autenticado');
    }

    // Consultar todas las transacciones de tipo Ingreso
    QuerySnapshot transaccionesSnapshot = await FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('movimiento', whereIn: ['Ingreso', 'ingreso']).get();

    // Agrupar transacciones por mes y año
    Map<String, Map<String, dynamic>> mesesData = {};

    for (var transDoc in transaccionesSnapshot.docs) {
      DateTime fecha = (transDoc['fecha'] as Timestamp).toDate();
      String mesAnio = '${fecha.month} ${fecha.year}';
      double monto = double.tryParse(transDoc['monto'].toString()) ?? 0.0;

      // Resolver la categoría
      DocumentReference categoriaRef = transDoc['categoria'];
      DocumentSnapshot categoriaDoc = await categoriaRef.get();
      String categoria = categoriaDoc['categoria'];

      if (!mesesData.containsKey(mesAnio)) {
        mesesData[mesAnio] = {
          'ingresoTotalMes': 0.0,
          'categorias': <String, Map<String, dynamic>>{}
        };
      }

      // Sumar al ingreso total del mes
      mesesData[mesAnio]!['ingresoTotalMes'] += monto;

      // Sumar el monto a la categoría correspondiente
      if (mesesData[mesAnio]!['categorias'].containsKey(categoria)) {
        mesesData[mesAnio]!['categorias'][categoria]!['ingresoPorCategoria'] +=
            monto;
      } else {
        mesesData[mesAnio]!['categorias'][categoria] = {
          'ingresoPorCategoria': monto,
        };
      }

      // Actualizar el mayor ingreso si es necesario
      if (mesesData[mesAnio]!['ingresoTotalMes'] > mayorIngreso) {
        mayorIngreso = mesesData[mesAnio]!['ingresoTotalMes'];
      }
    }

    // Asignar alturas y colores
    Random random = Random();
    List<Color> colores =
        FFAppState().colores; // Acceso a la AppState de colores

    mesesData.forEach((mes, data) {
      double ingresoTotalMes = data['ingresoTotalMes'];

      // Asignar alturaPadre (200px si es el máximo, proporcional para el resto)
      int alturaPadre = (ingresoTotalMes == mayorIngreso)
          ? 200
          : ((ingresoTotalMes / mayorIngreso) * 200).toInt();

      List<Map<String, dynamic>> categoriasList = [];

      // Asignar valores a cada categoría dentro del mes
      data['categorias'].forEach((categoria, catData) {
        double ingresoPorCategoria = catData['ingresoPorCategoria'];

        // Calcular altura proporcional a la categoría con respecto a la alturaPadre
        int altura =
            ((ingresoPorCategoria / ingresoTotalMes) * alturaPadre).toInt();

        // Seleccionar un color aleatorio
        Color colorAleatorio = colores[random.nextInt(colores.length)];

        // Guardar cada categoría en su propia lista para AppState hijo
        listaCategoriasHistorico.add({
          'fecha': mes,
          'categoria': categoria,
          'ingresoPorCategoria': ingresoPorCategoria,
          'color': colorAleatorio,
          'altura': altura,
        });

        categoriasList.add({
          'categoria': categoria,
          'ingresoPorCategoria': ingresoPorCategoria,
          'color': colorAleatorio,
          'altura': altura,
        });
      });

      // Guardar el mes y sus categorías en la lista de AppState padre
      listaMesesHistorico.add({
        'fecha': mes,
        'ingresoTotalMes': ingresoTotalMes,
        'alturaDataType': alturaPadre,
        'categoriasDataType': categoriasList,
      });
    });

    // Asignar los datos al AppState padre
    FFAppState().graficoHistoricoIngresoPadre = listaMesesHistorico
        .map((e) => GraficoHistoricoIngresoStruct(
              fecha: e['fecha'] as String,
              ingresoTotalMes: e['ingresoTotalMes'] as double,
              alturaDataType: e['alturaDataType'] as int,
            ))
        .toList();

    // Asignar los datos al AppState hijo
    FFAppState().graficoIngresoHistoricoHijo = listaCategoriasHistorico
        .map((e) => CategoriasIngresoHistoricoStruct(
              fecha: e['fecha'] as String,
              categoria: e['categoria'] as String,
              ingresoPorCategoria: e['ingresoPorCategoria'] as double,
              color: e['color'] as Color,
              altura: e['altura'] as int,
            ))
        .toList();

    print('Datos almacenados en la AppState');
  } catch (e) {
    print('Error en la consulta a Firebase: $e');
  }
}
