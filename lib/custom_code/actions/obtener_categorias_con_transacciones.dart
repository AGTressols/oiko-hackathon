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

import '/backend/schema/structs/index.dart'; // Asegúrate de que este import incluye los structs necesarios
import '/flutter_flow/flutter_flow_util.dart'; // Asegúrate de que FFAppState está definido aquí

Future<List<String>> obtenerCategoriasConTransacciones() async {
  List<String> categorias = [];

  try {
    // Obtener los períodos seleccionados desde la App State
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

    // Verificar que hay períodos seleccionados
    if (seleccionPeriodos.isEmpty) {
      print('OBTENER CAT CON TRANS: No hay períodos seleccionados.');
      return [];
    }

    // Convertir los períodos seleccionados en rangos de fechas
    List<Map<String, DateTime>> rangosDeFechas = [];

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
        print('OBTENER CAT CON TRANS: Formato de mes inválido: $mesAnio');
        continue;
      }

      int? mesNumero = meses[mesTexto];

      if (mesNumero == null) {
        print('OBTENER CAT CON TRANS: Mes inválido: $mesTexto');
        continue;
      }

      DateTime inicio = DateTime(year, mesNumero, 1);
      DateTime fin;

      if (mesNumero == 12) {
        fin = DateTime(year + 1, 1, 0, 23, 59, 59); // Último día de diciembre
      } else {
        fin =
            DateTime(year, mesNumero + 1, 0, 23, 59, 59); // Último día del mes
      }

      rangosDeFechas.add({'inicio': inicio, 'fin': fin});
    }

    // Verificar que tenemos al menos un rango de fechas válido
    if (rangosDeFechas.isEmpty) {
      print(
          'OBTENER CAT CON TRANS: No se pudieron obtener rangos de fechas válidos.');
      return [];
    }

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

          if (!categorias.contains(categoria)) {
            categorias.add(categoria);
          }
        } catch (e) {
          print(
              'OBTENER CAT CON TRANS: Error al parsear la fecha de la transacción: $e');
          continue;
        }
      }
    }

    // Actualizar la AppState con las categorías obtenidas
    FFAppState().seleccionCategorias = categorias;
    print(
        'OBTENER CAT CON TRANS: Categorías con transacciones: ${FFAppState().seleccionCategorias}');

    return categorias; // Retornar el listado de categorías
  } catch (e) {
    print('OBTENER CAT CON TRANS: Error al procesar las transacciones: $e');
    return []; // Retornar un listado vacío en caso de error
  }
}
