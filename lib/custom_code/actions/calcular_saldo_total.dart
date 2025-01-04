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

Future<double> calcularSaldoTotal() async {
  double totalIngresos = 0.0;
  double totalGastos = 0.0;
  double totalAjustes = 0.0;

  try {
    // Acceder al estado de la aplicación para obtener los períodos seleccionados
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;
    print('Períodos seleccionados: $seleccionPeriodos');

    // Verificar que hay períodos seleccionados
    if (seleccionPeriodos.isEmpty) {
      print('No hay períodos seleccionados.');
      FFAppState().saldoVariable = 0.0;
      return 0.0;
    }

    // Identificar el mes de corte (el mes más reciente seleccionado)
    DateTime? mesDeCorte;
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

      DateTime fechaMes = DateTime(year, mesNumero, 1);

      if (mesDeCorte == null || fechaMes.isAfter(mesDeCorte)) {
        mesDeCorte = fechaMes;
      }
    }

    if (mesDeCorte == null) {
      print('CALCULAR SALDO: Error: Mes de corte es nulo');
      FFAppState().saldoVariable = -1.0;
      return -1.0; // Retorna un valor negativo en caso de error
    }

    print('CALCULAR SALDO: Mes de corte: $mesDeCorte');

    // Definir el rango de la consulta desde el primer registro hasta el fin del mes de corte
    DateTime inicioHistorico =
        DateTime(1900); // Fecha muy antigua para incluir todos los registros
    DateTime finMesDeCorte =
        DateTime(mesDeCorte.year, mesDeCorte.month + 1, 0, 23, 59, 59);

    print('CALCULAR SALDO:  Inicio histórico: $inicioHistorico');
    print('CALCULAR SALDO: Fin del mes de corte: $finMesDeCorte');

    // Procesar transacciones de ingresos
    for (var transaccion in FFAppState().transaccionesIngreso) {
      // Parsear la fecha de la transacción
      if (transaccion.fecha != null && transaccion.fecha!.isNotEmpty) {
        try {
          DateTime fechaTransaccion = DateTime.parse(transaccion.fecha!);

          // Verificar si la transacción está dentro del rango
          if (fechaTransaccion.isAfter(
                  inicioHistorico.subtract(Duration(milliseconds: 1))) &&
              fechaTransaccion
                  .isBefore(finMesDeCorte.add(Duration(milliseconds: 1)))) {
            double monto = transaccion.monto ?? 0.0;
            totalIngresos += monto;
          }
        } catch (e) {
          print('Error al parsear la fecha de la transacción: $e');
          continue;
        }
      }
    }

    // Procesar transacciones de gastos
    for (var transaccion in FFAppState().transaccionesGasto) {
      // Parsear la fecha de la transacción
      if (transaccion.fecha != null && transaccion.fecha!.isNotEmpty) {
        try {
          DateTime fechaTransaccion = DateTime.parse(transaccion.fecha!);

          // Verificar si la transacción está dentro del rango
          if (fechaTransaccion.isAfter(
                  inicioHistorico.subtract(Duration(milliseconds: 1))) &&
              fechaTransaccion
                  .isBefore(finMesDeCorte.add(Duration(milliseconds: 1)))) {
            double monto = transaccion.monto ?? 0.0;
            totalGastos += monto;
          }
        } catch (e) {
          print('Error al parsear la fecha de la transacción: $e');
          continue;
        }
      }
    }

    // Procesar transacciones de ajustes
    for (var transaccion in FFAppState().transaccionesAjuste) {
      // Parsear la fecha de la transacción
      if (transaccion.fecha != null && transaccion.fecha!.isNotEmpty) {
        try {
          DateTime fechaTransaccion = DateTime.parse(transaccion.fecha!);

          // Verificar si la transacción está dentro del rango
          if (fechaTransaccion.isAfter(
                  inicioHistorico.subtract(Duration(milliseconds: 1))) &&
              fechaTransaccion
                  .isBefore(finMesDeCorte.add(Duration(milliseconds: 1)))) {
            // Obtener la cuenta asociada a la transacción
            String? cuentaNombre = transaccion.cuenta;

            // Buscar la cuenta en el caché
            CuentaCacheStructStruct? cuentaData;
            for (var cuenta in FFAppState().cacheCuentas) {
              if (cuenta.cuenta == cuentaNombre) {
                cuentaData = cuenta;
                break;
              }
            }

            if (cuentaData == null) {
              print(
                  'No se encontró la cuenta "${transaccion.cuenta}" en el caché.');
              continue;
            }

            bool esAhorro = cuentaData.ahorro ?? false;

            if (!esAhorro) {
              double monto = transaccion.monto ?? 0.0;
              totalAjustes += monto;
            }
          }
        } catch (e) {
          print('Error al parsear la fecha de la transacción: $e');
          continue;
        }
      }
    }

    // Calcular el saldo (ajustes + ingresos - gastos)
    double saldo = totalAjustes + totalIngresos - totalGastos;
    print('CALCULAR SALDO: Saldo calculado: $saldo');

    // Asignar el saldo a la App State como un valor double
    FFAppState().saldoVariable = saldo;

    // Retornar el saldo para otros usos si es necesario
    return saldo;
  } catch (e) {
    // Manejar el error y asignar el mensaje a la App State
    print('CALCULAR SALDO: Error en el cálculo del saldo: $e');
    FFAppState().saldoVariable =
        -1.0; // Retorna un valor negativo en caso de error
    return -1.0;
  }
}
