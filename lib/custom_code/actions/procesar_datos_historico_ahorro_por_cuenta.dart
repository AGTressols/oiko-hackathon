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
import 'package:intl/intl.dart'; // Para formatear fechas

Future<void> procesarDatosHistoricoAhorroPorCuenta() async {
  try {
    print('PROCESAR DATOS HISTÓRICO AHORRO: Iniciando función');

    // 1. Leer la cuenta seleccionada desde FFAppState().seleccionCuentaAhorro
    if (FFAppState().seleccionCuentaAhorro.isEmpty) {
      print('No hay cuenta seleccionada.');
      return;
    }
    String cuentaSeleccionada = FFAppState().seleccionCuentaAhorro[0];
    print('Cuenta seleccionada: $cuentaSeleccionada');

    // 2. Leer transacciones de ahorro desde FFAppState().transaccionesAhorro
    List<TotalidadDeTransaccionesStruct> transaccionesAhorro =
        FFAppState().transaccionesAhorro;

    // Verificar si hay transacciones
    if (transaccionesAhorro.isEmpty) {
      print('No hay transacciones de ahorro disponibles.');
      return;
    }

    // 3. Filtrar las transacciones de la cuenta seleccionada
    List<TotalidadDeTransaccionesStruct> transaccionesAhorroFiltradas =
        transaccionesAhorro.where((transaccion) {
      String? cuentaAhorroNombre = transaccion.cuentaCredito;
      if (cuentaAhorroNombre == null) return false;

      // Normalizar los nombres de las cuentas para evitar problemas de mayúsculas y espacios
      String cuentaAhorroNombreNormalizado =
          cuentaAhorroNombre.trim().toLowerCase();
      String cuentaSeleccionadaNormalizado =
          cuentaSeleccionada.trim().toLowerCase();

      return cuentaAhorroNombreNormalizado == cuentaSeleccionadaNormalizado;
    }).toList();

    if (transaccionesAhorroFiltradas.isEmpty) {
      print(
          'PROCESAR DATOS HISTÓRICO AHORRO: No hay transacciones para la cuenta seleccionada.');
      return;
    }

    print(
        'Transacciones filtradas para la cuenta seleccionada: ${transaccionesAhorroFiltradas.length}');

    // 4. Separar transacciones en Ahorros y Desahorros
    List<TotalidadDeTransaccionesStruct> transaccionesAhorros = [];
    List<TotalidadDeTransaccionesStruct> transaccionesDesahorros = [];

    for (var transaccion in transaccionesAhorroFiltradas) {
      double monto = transaccion.monto ?? 0.0;
      if (monto < 0) {
        // Ahorro: Invertir el signo para hacerlo positivo
        var nuevaTransaccion = TotalidadDeTransaccionesStruct(
          idTransaccion: transaccion.idTransaccion,
          fecha: transaccion.fecha,
          movimiento: transaccion.movimiento,
          monto: monto.abs(),
          montoAhorro: transaccion.montoAhorro,
          montoDivisa: transaccion.montoDivisa,
          cuenta: transaccion.cuenta,
          categoria: transaccion.categoria,
          etiqueta: transaccion.etiqueta,
          observacion: transaccion.observacion,
          cuentaCredito: transaccion.cuentaCredito,
          desahorro: transaccion.desahorro,
          timestamp: transaccion.timestamp,
          docRefTransac: transaccion.docRefTransac,
          docRefCuenta: transaccion.docRefCuenta,
          docRefCategoria: transaccion.docRefCategoria,
          docRefCuentaCredito: transaccion.docRefCuentaCredito,
          docRefEtiqueta: transaccion.docRefEtiqueta,
        );
        transaccionesAhorros.add(nuevaTransaccion);
      } else if (monto > 0) {
        // Desahorro: Invertir el signo para hacerlo negativo
        var nuevaTransaccion = TotalidadDeTransaccionesStruct(
          idTransaccion: transaccion.idTransaccion,
          fecha: transaccion.fecha,
          movimiento: transaccion.movimiento,
          monto: -monto,
          montoAhorro: transaccion.montoAhorro,
          montoDivisa: transaccion.montoDivisa,
          cuenta: transaccion.cuenta,
          categoria: transaccion.categoria,
          etiqueta: transaccion.etiqueta,
          observacion: transaccion.observacion,
          cuentaCredito: transaccion.cuentaCredito,
          desahorro: transaccion.desahorro,
          timestamp: transaccion.timestamp,
          docRefTransac: transaccion.docRefTransac,
          docRefCuenta: transaccion.docRefCuenta,
          docRefCategoria: transaccion.docRefCategoria,
          docRefCuentaCredito: transaccion.docRefCuentaCredito,
          docRefEtiqueta: transaccion.docRefEtiqueta,
        );
        transaccionesDesahorros.add(nuevaTransaccion);
      }
      // Si monto == 0, se ignora la transacción
    }

    print('Transacciones de Ahorros: ${transaccionesAhorros.length}');
    print('Transacciones de Desahorros: ${transaccionesDesahorros.length}');

    // 5. Obtener lista completa de meses desde el primer mes hasta el actual para Ahorros y Desahorros
    List<String> listaMesesAhorros =
        await generarListaMeses(transaccionesAhorros);
    List<String> listaMesesDesahorros =
        await generarListaMeses(transaccionesDesahorros);

    // Combinar ambas listas de meses y eliminar duplicados
    Set<String> conjuntoMeses = {...listaMesesAhorros, ...listaMesesDesahorros};
    List<String> listaMeses = conjuntoMeses.toList();

    // Ordenar la lista de meses cronológicamente
    listaMeses.sort((a, b) {
      DateTime fechaA = DateFormat('MMM yy', 'es_ES').parse(a);
      DateTime fechaB = DateFormat('MMM yy', 'es_ES').parse(b);
      return fechaA.compareTo(fechaB);
    });

    print('Lista de meses procesados: ${listaMeses.join(', ')}');

    // 6. Agrupar y calcular totales por mes para Ahorros
    Map<String, double> totalesAhorrosPorMes = await procesarTransacciones(
      transaccionesAhorros,
      listaMeses,
    );

    // 7. Agrupar y calcular totales por mes para Desahorros
    Map<String, double> totalesDesahorrosPorMes = await procesarTransacciones(
      transaccionesDesahorros,
      listaMeses,
    );

    print('Totales de Ahorros por mes: $totalesAhorrosPorMes');
    print('Totales de Desahorros por mes: $totalesDesahorrosPorMes');

    // 8. Calcular el neto de ahorro por mes (Ahorros - Desahorros)
    Map<String, double> netoAhorroPorMes = {};
    for (String mes in listaMeses) {
      double ahorro = totalesAhorrosPorMes[mes] ?? 0.0;
      double desahorro = totalesDesahorrosPorMes[mes] ?? 0.0; // Ya es negativo
      netoAhorroPorMes[mes] =
          ahorro + desahorro; // Equivale a Ahorro - Desahorro
    }

    print('Neto de ahorro por mes: $netoAhorroPorMes');

    // 9. Asignar tAhorro siempre a cuentaAhorroPadreMas y crear entradas para ambos padres en todos los meses
    List<GraficoAhorroPorCuentaPadreStruct> listaGraficoAhorroCuentaPadreMas =
        [];
    List<GraficoAhorroPorCuentaPadreStruct> listaGraficoAhorroCuentaPadreMenos =
        [];

    for (String mes in listaMeses) {
      double neto = netoAhorroPorMes[mes] ?? 0.0;

      // Crear entrada en PadreMas con tAhorro asignado
      var padreMasEntry = GraficoAhorroPorCuentaPadreStruct(
        fecha: mes,
        ahorroTotalMes: neto >= 0 ? neto : 0.0,
        alturaDataType: 0, // Se asignará después
        tAhorro: neto, // Asignar el neto aquí
      );
      listaGraficoAhorroCuentaPadreMas.add(padreMasEntry);

      // Crear entrada en PadreMenos con tAhorro asignado
      var padreMenosEntry = GraficoAhorroPorCuentaPadreStruct(
        fecha: mes,
        ahorroTotalMes: neto < 0 ? neto.abs() : 0.0,
        alturaDataType: 0, // Se asignará después
        tAhorro: neto, // Asignar el neto aquí si es necesario
      );
      listaGraficoAhorroCuentaPadreMenos.add(padreMenosEntry);
    }

    print('PadreMas entries: ${listaGraficoAhorroCuentaPadreMas.length}');
    print('PadreMenos entries: ${listaGraficoAhorroCuentaPadreMenos.length}');

    // 10. Encontrar el monto máximo para la escala en PadreMas y PadreMenos
    double montoMaximoPadreMas = listaGraficoAhorroCuentaPadreMas
        .map((p) => p.ahorroTotalMes)
        .reduce((a, b) => a > b ? a : b);

    double montoMaximoPadreMenos = listaGraficoAhorroCuentaPadreMenos.isNotEmpty
        ? listaGraficoAhorroCuentaPadreMenos
            .map((p) => p.ahorroTotalMes)
            .reduce((a, b) => a > b ? a : b)
        : 0.0;

    // 11. Calcular factores de escala separados para Mas y Menos
    double factorEscalaMas =
        (montoMaximoPadreMas > 0) ? 180 / montoMaximoPadreMas : 0.0;
    double factorEscalaMenos =
        (montoMaximoPadreMenos > 0) ? 180 / montoMaximoPadreMenos : 0.0;

    print('Factor de escala Mas: $factorEscalaMas');
    print('Factor de escala Menos: $factorEscalaMenos');

    // 12. Asignar alturas a los padres para PadreMas y PadreMenos
    for (var padre in listaGraficoAhorroCuentaPadreMas) {
      padre.alturaDataType = (padre.ahorroTotalMes * factorEscalaMas).round();
    }

    for (var padre in listaGraficoAhorroCuentaPadreMenos) {
      padre.alturaDataType = (padre.ahorroTotalMes * factorEscalaMenos).round();
    }

    // 13. Encontrar altura máxima para PadreMas y PadreMenos
    int alturaMaximaPadreMas = listaGraficoAhorroCuentaPadreMas.isNotEmpty
        ? listaGraficoAhorroCuentaPadreMas
            .map((p) => p.alturaDataType)
            .reduce((a, b) => a > b ? a : b)
        : 0;
    int alturaMaximaPadreMenos = listaGraficoAhorroCuentaPadreMenos.isNotEmpty
        ? listaGraficoAhorroCuentaPadreMenos
            .map((p) => p.alturaDataType)
            .reduce((a, b) => a > b ? a : b)
        : 0;

    print('Altura máxima PadreMas: $alturaMaximaPadreMas');
    print('Altura máxima PadreMenos: $alturaMaximaPadreMenos');

    // 14. Asignar datos a los AppStates
    FFAppState().cuentaAhorroPadreMas = listaGraficoAhorroCuentaPadreMas;
    FFAppState().cuentaAhorroPadreMenos = listaGraficoAhorroCuentaPadreMenos;

    FFAppState().alturaMaximaPadreMas = alturaMaximaPadreMas;
    FFAppState().alturaMaximaPadreMenos = alturaMaximaPadreMenos;

    // 15. Imprimir resultados
    print('PROCESAR DATOS HISTÓRICO AHORRO: Datos procesados exitosamente.');
    print('Altura máxima PadreMas: ${FFAppState().alturaMaximaPadreMas}');
    print('Altura máxima PadreMenos: ${FFAppState().alturaMaximaPadreMenos}');
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

  if (transacciones.isEmpty) {
    return [];
  }

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

  return listaMeses;
}

// Función para procesar transacciones y agrupar por mes
Future<Map<String, double>> procesarTransacciones(
    List<TotalidadDeTransaccionesStruct> transacciones,
    List<String> listaMeses) async {
  Map<String, double> totalesMes = {};

  // Inicializar totalesMes con ceros para todos los meses
  for (String mes in listaMeses) {
    totalesMes[mes] = 0.0;
  }

  // Procesar transacciones
  for (var transaccion in transacciones) {
    if (transaccion.fecha == null || transaccion.fecha!.isEmpty) {
      // Ignorar transacciones sin fecha válida
      continue;
    }

    DateTime fechaTransaccion = DateTime.parse(transaccion.fecha!);
    String mesAnio = DateFormat('MMM yy', 'es_ES').format(fechaTransaccion);
    // Convertir la primera letra a mayúscula
    mesAnio = mesAnio[0].toUpperCase() + mesAnio.substring(1);

    double monto = transaccion.monto ?? 0.0;

    // Acumular en totalesMes
    if (totalesMes.containsKey(mesAnio)) {
      totalesMes[mesAnio] = totalesMes[mesAnio]! + monto;
    } else {
      totalesMes[mesAnio] = monto;
    }
  }

  return totalesMes;
}
