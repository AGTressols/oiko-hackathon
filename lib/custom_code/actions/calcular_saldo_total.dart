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
  double totalAjustes = 0.0; // Nueva variable para los ajustes

  try {
    // Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      print('Error: No hay usuario autenticado');
      return -1.0; // Retorna un valor negativo o de error en caso de que no haya usuario autenticado
    }
    print('UID del usuario autenticado: $uid');

    // Acceder al estado de la aplicación para obtener los períodos seleccionados
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;
    print('Períodos seleccionados: $seleccionPeriodos');

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
      print('Error: Mes de corte es nulo');
      return -1.0; // Retorna un valor negativo en caso de error
    }

    print('Mes de corte: $mesDeCorte');

    // Definir el rango de la consulta desde el primer registro hasta el fin del mes de corte
    DateTime inicioHistorico =
        DateTime(1900); // Fecha muy antigua para incluir todos los registros
    DateTime finMesDeCorte =
        DateTime(mesDeCorte.year, mesDeCorte.month + 1, 0, 23, 59, 59);

    print('Inicio histórico: $inicioHistorico');
    print('Fin del mes de corte: $finMesDeCorte');

    // Realizar la consulta a Firebase para ingresos, gastos y ajustes hasta el mes de corte
    final transaccionesSnapshot = await FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('fecha', isGreaterThanOrEqualTo: inicioHistorico)
        .where('fecha', isLessThanOrEqualTo: finMesDeCorte)
        .get();

    print('Transacciones encontradas: ${transaccionesSnapshot.docs.length}');

    // Procesar los resultados de la consulta
    for (var doc in transaccionesSnapshot.docs) {
      String tipoMovimiento = doc['movimiento'];

      // Convertir el monto a double explícitamente en caso de ser int
      double monto = (doc['monto'] is int)
          ? (doc['monto'] as int).toDouble()
          : doc['monto'];

      print('Transacción tipo: $tipoMovimiento, monto: $monto');

      if (tipoMovimiento == 'Ingreso') {
        totalIngresos += monto;
        print('Total ingresos actualizado: $totalIngresos');
      } else if (tipoMovimiento == 'Gasto') {
        totalGastos += monto;
        print('Total gastos actualizado: $totalGastos');
      } else if (tipoMovimiento == 'Ajuste') {
        // Resolver la referencia del campo "cuenta"
        DocumentReference cuentaRef = doc['cuenta'];
        DocumentSnapshot cuentaDoc = await cuentaRef.get();

        // Verificar si el campo "ahorro" es false en la cuenta
        bool esAhorro = cuentaDoc['ahorro'] ??
            false; // Si no existe el campo, asumimos false
        if (!esAhorro) {
          totalAjustes += monto;
          print('Total ajustes actualizado: $totalAjustes');
        }
      }
    }

    // Calcular el saldo (ajustes + ingresos - gastos)
    double saldo = totalAjustes + totalIngresos - totalGastos;
    print('Saldo calculado: $saldo');

    // Asignar el saldo a la App State como un valor double
    FFAppState().saldoVariable = saldo;

    // Retornar el saldo para otros usos si es necesario
    return saldo;
  } catch (e) {
    // Manejar el error y asignar el mensaje a la App State
    print('Error en el cálculo del saldo: $e');
    FFAppState().saldoVariable =
        -1.0; // Retorna un valor negativo en caso de error
    return -1.0;
  }
}
