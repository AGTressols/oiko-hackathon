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

Future<void> calcularSaldoAhorroGeneral() async {
  double totalAhorro = 0.0;

  try {
    // Acceder al estado de la aplicación para obtener los períodos seleccionados
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

    // Verificar que hay períodos seleccionados
    if (seleccionPeriodos.isEmpty) {
      print('No hay períodos seleccionados.');
      return;
    }

    // Convertir los meses seleccionados a rangos de fechas
    List<Map<String, DateTime>> convertirMesesARangos(
        List<String> mesesSeleccionados) {
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

      for (String mesAnio in mesesSeleccionados) {
        // Suponemos que el formato es 'Mes Año', por ejemplo 'Enero 2023'
        List<String> partes = mesAnio.split(' ');
        if (partes.length != 2) {
          print('Formato de mes y año inválido: $mesAnio');
          continue;
        }
        String mesTexto = partes[0];
        int? year = int.tryParse(partes[1]);
        int? mesNumero = meses[mesTexto];

        if (year == null || mesNumero == null) {
          print('Error al parsear mes y año: $mesAnio');
          continue;
        }

        DateTime inicio = DateTime(year, mesNumero, 1);
        DateTime fin;
        if (mesNumero == 12) {
          fin = DateTime(year + 1, 1, 0, 23, 59, 59); // Último día de diciembre
        } else {
          fin = DateTime(
              year, mesNumero + 1, 0, 23, 59, 59); // Último día del mes
        }
        rangosDeFechas.add({'inicio': inicio, 'fin': fin});
      }

      return rangosDeFechas;
    }

    // Convertir los meses seleccionados a rangos de fechas
    List<Map<String, DateTime>> rangosDeFechas =
        convertirMesesARangos(seleccionPeriodos);

    // Verificar que tenemos al menos un rango de fechas válido
    if (rangosDeFechas.isEmpty) {
      print('No se pudieron obtener rangos de fechas válidos.');
      return;
    }

    // Variable para acumular el saldo de ahorro general
    double saldoAhorroGeneral = 0.0;

    // Obtener las transacciones de tipo 'Ahorro' desde FFAppState
    List<TotalidadDeTransaccionesStruct> transaccionesAhorro =
        FFAppState().transaccionesAhorro;

    // Procesar las transacciones
    for (var transaccion in transaccionesAhorro) {
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

          // Obtener el monto de la transacción
          double monto = transaccion.monto ?? 0.0;
          // Invertir el signo del monto
          saldoAhorroGeneral += monto * -1;
        } catch (e) {
          print('Error al parsear la fecha de la transacción: $e');
          continue;
        }
      }
    }

    // Guardar el saldo de ahorro general en la AppState
    FFAppState().saldoAhorroGeneral = saldoAhorroGeneral;
    print('SALDO AHORRO GENERAL = $saldoAhorroGeneral');
  } catch (e) {
    print('CALCULAR SALDO AHORRO GENERAL: Error al procesar los datos: $e');

    // Manejar el error y asignar el mensaje a la AppState
    FFAppState().saldoAhorroGeneral =
        -1.0; // Retorna un valor negativo en caso de error
  }
}
