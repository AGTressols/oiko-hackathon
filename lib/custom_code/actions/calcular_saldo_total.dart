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

// Importación adicional para autenticación de Firebase
import 'package:firebase_auth/firebase_auth.dart';

Future<double> calcularSaldoTotal() async {
  double totalIngresos = 0.0;
  double totalGastos = 0.0;

  try {
    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return -1.0; // Retorna un valor negativo o de error en caso de que no haya usuario autenticado
    }

    // Acceder al estado de la aplicación para obtener los períodos seleccionados
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

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

    for (String mes in seleccionPeriodos) {
      int year = DateTime.now().year; // O usar el año que desees
      int mesNumero = meses[mes]!;
      DateTime fechaMes = DateTime(year, mesNumero, 1);

      if (mesDeCorte == null || fechaMes.isAfter(mesDeCorte)) {
        mesDeCorte = fechaMes;
      }
    }

    if (mesDeCorte == null) {
      return -1.0; // Retorna un valor negativo en caso de error
    }

    // Definir el rango de la consulta desde el primer registro hasta el fin del mes de corte
    DateTime inicioHistorico =
        DateTime(1900); // Fecha muy antigua para incluir todos los registros
    DateTime finMesDeCorte =
        DateTime(mesDeCorte.year, mesDeCorte.month + 1, 0, 23, 59, 59);

    // Realizar la consulta a Firebase para ingresos y gastos hasta el mes de corte
    final transaccionesSnapshot = await FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('fecha', isGreaterThanOrEqualTo: inicioHistorico)
        .where('fecha', isLessThanOrEqualTo: finMesDeCorte)
        .get();

    // Procesar los resultados de la consulta
    for (var doc in transaccionesSnapshot.docs) {
      String tipoMovimiento = doc['movimiento'];
      double monto = doc['monto'];

      if (tipoMovimiento.toLowerCase() == 'ingreso') {
        totalIngresos += monto;
      } else if (tipoMovimiento.toLowerCase() == 'gasto') {
        totalGastos += monto;
      }
    }

    // Calcular el saldo (ingresos - gastos)
    double saldo = totalIngresos - totalGastos;

    // Asignar el saldo a la App State como un valor double
    FFAppState().saldoVariable = saldo;

    // Retornar el saldo para otros usos si es necesario
    return saldo;
  } catch (e) {
    // Manejar el error y asignar el mensaje a la App State
    FFAppState().saldoVariable =
        -1.0; // Retorna un valor negativo en caso de error
    return -1.0;
  }
}
