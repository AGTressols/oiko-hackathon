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

Future<void> procesarDatosGraficoPresupuesto() async {
  // Inicializar la lista para almacenar los datos de las categorías
  List<Map<String, dynamic>> listaGraficoPresupuesto = [];

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

    // Consultar las transacciones filtradas por UID, Movimiento y Fecha
    QuerySnapshot transaccionesSnapshot = await FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('movimiento', whereIn: ['Gasto', 'gasto']).get();

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
      String logo = categoriaDoc['logo'];
      double monto = double.tryParse(transDoc['monto'].toString()) ?? 0.0;

      // Si la categoría ya existe en el mapa, actualizar los valores
      if (categoriasData.containsKey(categoria)) {
        categoriasData[categoria]!['gastadoAbs'] += monto;
      } else {
        // Si no existe, crear una nueva entrada en el mapa
        categoriasData[categoria] = {
          'categoria': categoria,
          'logo': logo,
          'gastadoAbs': monto,
          'presupuesto':
              double.tryParse(categoriaDoc['presupuesto'].toString()) ?? 0.0,
        };
      }
    }

    // Calcular el presupuesto disponible y el presupuesto gráfico para cada categoría
    categoriasData.forEach((categoria, data) {
      double presupuestoAjustado =
          data['presupuesto'] * seleccionPeriodos.length;
      double presupuestoDisponible = presupuestoAjustado - data['gastadoAbs'];
      if (presupuestoAjustado < 1) {
        presupuestoAjustado = 1;
      }
      // Calcular el porcentaje del gasto sobre el presupuesto ajustado
      double porcentajeGrafico = (data['gastadoAbs'] / presupuestoAjustado);

      // Aplicar el ajuste: si el resultado es menor a 1, asignar 1

      // Multiplicar el porcentaje por 235 px para obtener el valor en píxeles
      int widthInPx = (porcentajeGrafico * 235).toInt();

      listaGraficoPresupuesto.add({
        'categoria': data['categoria'],
        'logo': data['logo'],
        'gastoAbs': data['gastadoAbs'].toInt(),
        'presupuestoDisponible': presupuestoDisponible.toInt(),
        'presupuestoGrafico': widthInPx,
      });
    });

    // Almacenar los detalles en la App State
    FFAppState().graficoPresupuestoAppState = listaGraficoPresupuesto
        .map((e) => GraficoPresupuestoStruct(
              categoria: e['categoria'] as String,
              logo: e['logo'] as String,
              gastadoAbs: e['gastoAbs'] as int,
              presupuestoDisponible: e['presupuestoDisponible'] as int,
              presupuestoGrafico: e['presupuestoGrafico'] as int,
            ))
        .toList();

    print(
        'Datos almacenados en la App State: ${FFAppState().graficoPresupuestoAppState}');
  } catch (e) {
    print('Error en la consulta a Firebase: $e');
  }
}
