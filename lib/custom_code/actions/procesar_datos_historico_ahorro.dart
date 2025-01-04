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
import 'dart:math'; // Para el uso de Random()
import 'package:intl/intl.dart'; // Para formatear fechas

Future<void> procesarDatosHistoricoAhorro() async {
  try {
    print('PROCESAR DATOS HISTÓRICO AHORRO: Iniciando función');

    // 1. Leer transacciones de ahorro desde FFAppState().transaccionesAhorro
    List<TotalidadDeTransaccionesStruct> transaccionesAhorro =
        FFAppState().transaccionesAhorro;

    // Verificar si hay transacciones
    if (transaccionesAhorro.isEmpty) {
      print('No hay transacciones de ahorro disponibles.');
      return;
    }

    // 2. Separar transacciones en ahorros y desahorros
    List<TotalidadDeTransaccionesStruct> transaccionesAhorroNegativo = [];
    List<TotalidadDeTransaccionesStruct> transaccionesAhorroPositivo = [];

    for (var transaccion in transaccionesAhorro) {
      double monto = transaccion.monto ?? 0.0;
      if (monto < 0) {
        transaccionesAhorroNegativo.add(transaccion);
      } else {
        transaccionesAhorroPositivo.add(transaccion);
      }
    }

    // 3. Obtener lista completa de meses desde el primer mes hasta el actual
    List<String> listaMeses = await generarListaMeses(transaccionesAhorro);

    // Invertir la lista para que el mes actual esté primero
    listaMeses = listaMeses.reversed.toList();

    // 4. Procesar ahorros y desahorros por separado
    Map<String, dynamic> datosAhorros = await procesarTransacciones(
      transaccionesAhorroNegativo,
      listaMeses,
      isAhorro: true,
    );

    Map<String, dynamic> datosDesahorros = await procesarTransacciones(
      transaccionesAhorroPositivo,
      listaMeses,
      isAhorro: false,
    );

    // 5. Combinar montos totales para encontrar el monto máximo para la escala
    List<double> montosTotales = [
      ...datosAhorros['totalesMes'].values,
      ...datosDesahorros['totalesMes'].values
    ];
    double montoTotalMaximo = montosTotales.isNotEmpty
        ? montosTotales.reduce((a, b) => a > b ? a : b)
        : 0.0;

    // Factor de escala: altura por monto
    double factorEscala = (montoTotalMaximo > 0) ? 180 / montoTotalMaximo : 0.0;

    // 6. Calcular alturas y crear listas de padres e hijos para ahorros y desahorros
    List<GraficoAhorroPorCuentaPadreStruct> listaPadreAhorros =
        crearListaPadre(datosAhorros, factorEscala, isAhorro: true);
    List<GraficoAhorroPorCuentaPadreStruct> listaPadreDesahorros =
        crearListaPadre(datosDesahorros, factorEscala, isAhorro: false);

    List<GraficoAhorroPorCuentaHijoStruct> listaHijoAhorros =
        crearListaHijo(datosAhorros, factorEscala);
    List<GraficoAhorroPorCuentaHijoStruct> listaHijoDesahorros =
        crearListaHijo(datosDesahorros, factorEscala);

    // 6.a. **Convertir 'ahorroPorCuenta' a negativo para desahorros**
    for (var hijo in listaHijoDesahorros) {
      hijo.ahorroPorCuenta = -hijo.ahorroPorCuenta;
    }

    // Calcular tAhorro como la resta entre ahorros y desahorros en cada mes
    Map<String, double> totalesAhorrosMes = datosAhorros['totalesMes'];
    Map<String, double> totalesDesahorrosMes = datosDesahorros['totalesMes'];

    for (var padre in listaPadreAhorros) {
      String mes = padre.fecha;
      double totalAhorrosMes = totalesAhorrosMes[mes] ?? 0.0;
      double totalDesahorrosMes = totalesDesahorrosMes[mes] ?? 0.0;

      double tAhorro = totalAhorrosMes - totalDesahorrosMes;
      padre.tAhorro = tAhorro;
    }

    // 7. Encontrar alturas máximas para los AppStates
    int alturaMaximaContainerPadreAhorroMas = listaPadreAhorros.isNotEmpty
        ? listaPadreAhorros
            .map((p) => p.alturaDataType)
            .reduce((a, b) => a > b ? a : b)
        : 0;

    int alturaMaximaContainerPadreAhorroMenos = listaPadreDesahorros.isNotEmpty
        ? listaPadreDesahorros
            .map((p) => p.alturaDataType)
            .reduce((a, b) => a > b ? a : b)
        : 0;

    // 8. Asignar colores
    asignarColores(listaHijoAhorros);
    asignarColores(listaHijoDesahorros);

    // 9. Asignar datos a los AppStates
    FFAppState().graficoAhorroPorCuentaPadre = listaPadreAhorros;
    FFAppState().graficoAhorroPorCuentaHijo = listaHijoAhorros;

    FFAppState().padreMenos = listaPadreDesahorros;
    FFAppState().hijoMenos = listaHijoDesahorros;

    // 10. Asignar alturas máximas a los AppStates
    FFAppState().alturaMaximaContainerPadreAhorroMas =
        alturaMaximaContainerPadreAhorroMas;
    FFAppState().alturaMaximaContainerPadreAhorroMenos =
        alturaMaximaContainerPadreAhorroMenos;

    // 11. Imprimir resultados
    print('PROCESAR DATOS HISTÓRICO AHORRO: Datos procesados exitosamente.');
    print(
        'Altura máxima Ahorros: ${FFAppState().alturaMaximaContainerPadreAhorroMas}');
    print(
        'Altura máxima Desahorros: ${FFAppState().alturaMaximaContainerPadreAhorroMenos}');
  } catch (e, stacktrace) {
    print('Error en procesarDatosHistoricoAhorro: $e');
    print(stacktrace);
  }
}

// Función para generar la lista completa de meses entre el primer mes y el actual
Future<List<String>> generarListaMeses(
    List<TotalidadDeTransaccionesStruct> transacciones) async {
  // Obtener la fecha actual
  DateTime fechaActual = DateTime.now();

  // Obtener la fecha de la primera transacción
  transacciones.sort((a, b) {
    DateTime fechaA = DateTime.parse(a.fecha ?? '1970-01-01');
    DateTime fechaB = DateTime.parse(b.fecha ?? '1970-01-01');
    return fechaA.compareTo(fechaB);
  });

  DateTime fechaInicio =
      DateTime.parse(transacciones.first.fecha ?? '1970-01-01');

  // Generar la lista de meses
  List<String> listaMeses = [];
  DateTime fechaTemp = DateTime(fechaInicio.year, fechaInicio.month);

  while (
      fechaTemp.isBefore(DateTime(fechaActual.year, fechaActual.month + 1))) {
    String mesFormateado = DateFormat('MMM yy', 'es_ES').format(fechaTemp);
    // Convertir la primera letra a mayúscula
    mesFormateado = mesFormateado[0].toUpperCase() + mesFormateado.substring(1);
    listaMeses.add(mesFormateado);
    fechaTemp = DateTime(fechaTemp.year, fechaTemp.month + 1);
  }

  // Invertir la lista para que el mes actual esté primero
  listaMeses = listaMeses.reversed.toList();

  return listaMeses;
}

// Función para procesar transacciones (ahorros o desahorros)
Future<Map<String, dynamic>> procesarTransacciones(
    List<TotalidadDeTransaccionesStruct> transacciones, List<String> listaMeses,
    {required bool isAhorro}) async {
  Map<String, double> totalesMes = {};
  Map<String, Map<String, double>> montosPorCuentaYMes = {};

  // Inicializar totalesMes con ceros para todos los meses
  for (String mes in listaMeses) {
    totalesMes[mes] = 0.0;
    montosPorCuentaYMes[mes] = {};
  }

  // Procesar transacciones
  for (var transaccion in transacciones) {
    DateTime fechaTransaccion = DateTime.parse(transaccion.fecha ?? '');
    String mesAnio = DateFormat('MMM yy', 'es_ES').format(fechaTransaccion);
    // Convertir la primera letra a mayúscula
    mesAnio = mesAnio[0].toUpperCase() + mesAnio.substring(1);

    double monto = transaccion.monto ?? 0.0;
    monto = monto.abs(); // Invertir el signo para tener valores positivos

    // Acumular en totalesMes
    totalesMes[mesAnio] = (totalesMes[mesAnio] ?? 0.0) + monto;

    // Acumular por cuenta
    String cuentaAhorro = transaccion.cuentaCredito ?? 'Sin cuenta';

    montosPorCuentaYMes[mesAnio]![cuentaAhorro] =
        (montosPorCuentaYMes[mesAnio]![cuentaAhorro] ?? 0.0) + monto;
  }

  return {
    'totalesMes': totalesMes,
    'montosPorCuentaYMes': montosPorCuentaYMes,
  };
}

// Función para crear la lista de padres
List<GraficoAhorroPorCuentaPadreStruct> crearListaPadre(
    Map<String, dynamic> datos, double factorEscala,
    {required bool isAhorro}) {
  List<GraficoAhorroPorCuentaPadreStruct> listaPadre = [];

  Map<String, double> totalesMes = datos['totalesMes'];

  for (var entry in totalesMes.entries) {
    String mes = entry.key;
    double totalMes = entry.value;

    int alturaDataType = (totalMes * factorEscala).round();

    var padreStruct = GraficoAhorroPorCuentaPadreStruct(
      fecha: mes,
      ahorroTotalMes: totalMes,
      alturaDataType: alturaDataType,
      tAhorro: 0.0, // Se asignará después
    );

    listaPadre.add(padreStruct);
  }

  return listaPadre;
}

// Función para crear la lista de hijos
List<GraficoAhorroPorCuentaHijoStruct> crearListaHijo(
    Map<String, dynamic> datos, double factorEscala) {
  List<GraficoAhorroPorCuentaHijoStruct> listaHijo = [];

  Map<String, Map<String, double>> montosPorCuentaYMes =
      datos['montosPorCuentaYMes'];

  for (var mesEntry in montosPorCuentaYMes.entries) {
    String mes = mesEntry.key;
    Map<String, double> cuentas = mesEntry.value;

    double totalMes = datos['totalesMes'][mes] ?? 0.0;
    int alturaTotalMes = (totalMes * factorEscala).round();

    for (var cuentaEntry in cuentas.entries) {
      String cuentaAhorro = cuentaEntry.key;
      double montoCuenta = cuentaEntry.value;

      int alturaHijo = (montoCuenta * factorEscala).round();

      var hijoStruct = GraficoAhorroPorCuentaHijoStruct(
        fecha: mes,
        ahorroPorCuenta: montoCuenta,
        color: Colors.transparent, // Se asignará después
        altura: alturaHijo,
        cuentaAhorro: cuentaAhorro,
      );

      listaHijo.add(hijoStruct);
    }
  }

  return listaHijo;
}

// Función para asignar colores a los hijos
void asignarColores(List<GraficoAhorroPorCuentaHijoStruct> listaHijo) {
  List<Color> colores = FFAppState().colores;
  Map<String, Color> cuentaColores = {};

  int colorIndex = 0;

  // Asignar colores a cuentas en orden
  for (var hijo in listaHijo) {
    String cuenta = hijo.cuentaAhorro;

    if (!cuentaColores.containsKey(cuenta)) {
      // Asignar el siguiente color de la lista
      if (colorIndex < colores.length) {
        cuentaColores[cuenta] = colores[colorIndex];
        colorIndex++;
      } else {
        // Si se acaban los colores, volver al inicio
        colorIndex = 0;
        cuentaColores[cuenta] = colores[colorIndex];
        colorIndex++;
      }
    }
  }

  // Asignar colores a los hijos
  for (var hijo in listaHijo) {
    String cuenta = hijo.cuentaAhorro;
    hijo.color = cuentaColores[cuenta] ?? Colors.transparent;
  }
}
