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

Future<double> calcularGastosEIngresosTotales() async {
  double totalGastos = 0.0;
  double totalIngresos = 0.0;
  double totalAhorro = 0.0;

  try {
    // Obtener los períodos seleccionados del AppState
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

    // Verificar que hay períodos seleccionados
    if (seleccionPeriodos.isEmpty) {
      print('No hay períodos seleccionados.');
      return 0.0;
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

      for (String mes in mesesSeleccionados) {
        int year = DateTime.now().year; // O usar el año que desees
        int mesNumero = meses[mes]!;
        DateTime inicio = DateTime(year, mesNumero, 1);
        DateTime fin =
            DateTime(year, mesNumero + 1, 0, 23, 59, 59); // Último día del mes
        rangosDeFechas.add({'inicio': inicio, 'fin': fin});
      }

      return rangosDeFechas;
    }

    // Convertir los meses seleccionados a rangos de fechas
    List<Map<String, DateTime>> rangosDeFechas =
        convertirMesesARangos(seleccionPeriodos);

    // Función para verificar si una fecha está dentro de los rangos
    bool fechaEnRangos(DateTime fecha, List<Map<String, DateTime>> rangos) {
      for (var rango in rangos) {
        if (fecha.isAfter(
                rango['inicio']!.subtract(Duration(milliseconds: 1))) &&
            fecha.isBefore(rango['fin']!.add(Duration(milliseconds: 1)))) {
          return true;
        }
      }
      return false;
    }

    // Procesar transacciones de gastos
    for (var transaccion in FFAppState().transaccionesGasto) {
      // Parsear la fecha
      if (transaccion.fecha != null && transaccion.fecha!.isNotEmpty) {
        try {
          DateTime fechaTransaccion = DateTime.parse(transaccion.fecha!);
          if (fechaEnRangos(fechaTransaccion, rangosDeFechas)) {
            totalGastos += transaccion.monto ?? 0.0;
          }
        } catch (e) {
          print('Error al parsear la fecha de la transacción: $e');
        }
      }
    }

    // Procesar transacciones de ingresos
    for (var transaccion in FFAppState().transaccionesIngreso) {
      // Parsear la fecha
      if (transaccion.fecha != null && transaccion.fecha!.isNotEmpty) {
        try {
          DateTime fechaTransaccion = DateTime.parse(transaccion.fecha!);
          if (fechaEnRangos(fechaTransaccion, rangosDeFechas)) {
            totalIngresos += transaccion.monto ?? 0.0;
          }
        } catch (e) {
          print('Error al parsear la fecha de la transacción: $e');
        }
      }
    }

    // Procesar transacciones de ahorro
    for (var transaccion in FFAppState().transaccionesAhorro) {
      // Parsear la fecha
      if (transaccion.fecha != null && transaccion.fecha!.isNotEmpty) {
        try {
          DateTime fechaTransaccion = DateTime.parse(transaccion.fecha!);
          if (fechaEnRangos(fechaTransaccion, rangosDeFechas)) {
            totalAhorro += (transaccion.monto ?? 0.0) * -1; // Invertir el signo
          }
        } catch (e) {
          print('Error al parsear la fecha de la transacción: $e');
        }
      }
    }

    // Guardar los totales en el AppState
    FFAppState().gastoTotalVariable = totalGastos;
    FFAppState().ingresoTotalVariable = totalIngresos;
    FFAppState().saldoAhorroGeneral = totalAhorro;

    print('TOTAL GASTOS = $totalGastos');
    print('TOTAL INGRESOS = $totalIngresos');
    print('TOTAL AHORRO = $totalAhorro');

    // Retornar el total de gastos
    return totalGastos;
  } catch (e) {
    print('Error al calcular gastos e ingresos totales: $e');

    // Manejar el error y asignar valores negativos a las variables del AppState
    FFAppState().gastoTotalVariable = -1.0;
    FFAppState().ingresoTotalVariable = -1.0;
    FFAppState().saldoAhorroGeneral = -1.0;
    return -1.0;
  }
}
