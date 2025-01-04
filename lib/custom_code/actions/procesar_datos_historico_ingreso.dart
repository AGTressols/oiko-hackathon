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

Future<void> procesarDatosHistoricoIngreso() async {
  // Inicializar las listas para guardar datos
  List<Map<String, dynamic>> listaMesesHistorico = [];
  List<Map<String, dynamic>> listaCategoriasHistorico = [];
  List<Map<String, dynamic>> listaGraficoIngreso = [];
  double mayorIngreso = 0.0;
  double totalIngresoSeleccionado = 0.0;

  try {
    print('PROCESAR DATOS INGRESO: Iniciando función');

    // Obtener las transacciones de ingreso desde FFAppState().transaccionesIngreso
    List<TotalidadDeTransaccionesStruct> transaccionesIngreso =
        FFAppState().transaccionesIngreso;

    // Verificar que hay transacciones disponibles
    if (transaccionesIngreso.isEmpty) {
      print(
          'PROCESAR DATOS INGRESO: No hay transacciones de ingreso disponibles.');
      return;
    }

    // Definir la lista de meses en español
    List<String> meses = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic'
    ];

    // Mapa para almacenar los datos de los meses
    Map<String, Map<String, dynamic>> mesesData = {};
    // Mapa para almacenar los totales por categoría (para ambos gráficos)
    Map<String, Map<String, dynamic>> categoriasTotales = {};
    // Lista para mantener el orden de las categorías
    List<String> listaCategoriasOrdenadas = [];

    DateTime? fechaMin;
    DateTime? fechaMax;

    // 1. Procesamiento de datos históricos (no condicionado por periodos)
    for (var transaccion in transaccionesIngreso) {
      // Obtener la fecha de la transacción
      if (transaccion.fecha == null || transaccion.fecha!.isEmpty) {
        print('PROCESAR DATOS INGRESO: Transacción sin fecha.');
        continue;
      }
      DateTime fecha = DateTime.parse(transaccion.fecha!);

      // Actualizar fecha mínima y máxima
      DateTime fechaMes = DateTime(fecha.year, fecha.month);
      if (fechaMin == null || fechaMes.isBefore(fechaMin)) {
        fechaMin = fechaMes;
      }
      if (fechaMax == null || fechaMes.isAfter(fechaMax)) {
        fechaMax = fechaMes;
      }

      int mesIndex = fecha.month - 1;
      String mesNombre = meses[mesIndex];
      String anio = fecha.year.toString().substring(2); // Últimos dos dígitos
      String mesAnio = '$mesNombre $anio';

      double monto = transaccion.monto ?? 0.0;

      // Obtener la categoría de la transacción
      String categoria = transaccion.categoria ?? 'Sin Categoría';

      // Agregar categoría a la lista ordenada si no existe
      if (!listaCategoriasOrdenadas.contains(categoria)) {
        listaCategoriasOrdenadas.add(categoria);
      }

      // Actualizar datos en mesesData
      if (!mesesData.containsKey(mesAnio)) {
        mesesData[mesAnio] = {
          'ingresoTotalMes': 0.0,
          'categorias': <String, double>{}
        };
      }

      // Sumar al ingreso total del mes
      mesesData[mesAnio]!['ingresoTotalMes'] += monto;

      // Sumar el monto a la categoría correspondiente en el mes
      mesesData[mesAnio]!['categorias'][categoria] =
          (mesesData[mesAnio]!['categorias'][categoria] ?? 0.0) + monto;

      // Actualizar el mayor ingreso si es necesario
      if (mesesData[mesAnio]!['ingresoTotalMes'] > mayorIngreso) {
        mayorIngreso = mesesData[mesAnio]!['ingresoTotalMes'];
      }

      // Actualizar totales por categoría para el gráfico de ingreso por categoría
      categoriasTotales[categoria] = {
        'ingresoAbs':
            (categoriasTotales[categoria]?['ingresoAbs'] ?? 0.0) + monto,
        'porcentajeIngreso': 0.0, // Se calculará más adelante
        'ingresoPx': 0, // Se calculará más adelante
      };
    }

    // Generar lista de meses completos entre fechaMin y fechaMax
    List<String> listaMesesCompletos = [];
    if (fechaMin != null && fechaMax != null) {
      DateTime fechaIterativa = fechaMin;
      DateTime fechaFinal = fechaMax;

      while (fechaIterativa.isBefore(fechaFinal) ||
          fechaIterativa.isAtSameMomentAs(fechaFinal)) {
        int mesIndex = fechaIterativa.month - 1;
        String mesNombre = meses[mesIndex];
        String anio = fechaIterativa.year.toString().substring(2);
        String mesAnio = '$mesNombre $anio';

        listaMesesCompletos.add(mesAnio);

        // Sumar un mes
        fechaIterativa = DateTime(
          fechaIterativa.month == 12
              ? fechaIterativa.year + 1
              : fechaIterativa.year,
          fechaIterativa.month % 12 + 1,
        );
      }
    }

    // Asegurarse de que todos los meses estén en mesesData, incluso si no tienen datos
    for (String mesAnio in listaMesesCompletos) {
      if (!mesesData.containsKey(mesAnio)) {
        mesesData[mesAnio] = {
          'ingresoTotalMes': 0.0,
          'categorias': <String, double>{}
        };
      }
    }

    // Ordenar los meses de más reciente a más antiguo
    listaMesesCompletos.sort((a, b) {
      // Extraer mes y año de los strings
      List<String> aParts = a.split(' ');
      List<String> bParts = b.split(' ');

      int aMesIndex = meses.indexOf(aParts[0]);
      int bMesIndex = meses.indexOf(bParts[0]);

      int aAnio = int.parse(aParts[1]);
      int bAnio = int.parse(bParts[1]);

      DateTime fechaA = DateTime(2000 + aAnio, aMesIndex + 1);
      DateTime fechaB = DateTime(2000 + bAnio, bMesIndex + 1);

      return fechaB.compareTo(fechaA); // Ordenar de más reciente a más antiguo
    });

    // Asignar colores a las categorías en orden
    List<Color> colores = FFAppState().colores; // Acceso a la lista de colores
    Map<String, Color> categoriaColorMap = {};
    for (int i = 0; i < listaCategoriasOrdenadas.length; i++) {
      String categoria = listaCategoriasOrdenadas[i];
      Color color = colores[i % colores.length];
      categoriaColorMap[categoria] = color;
    }

    // Procesar datos para el gráfico histórico
    for (String mesAnio in listaMesesCompletos) {
      var data = mesesData[mesAnio]!;
      double ingresoTotalMes = data['ingresoTotalMes'];

      // Asignar alturaPadre (200px si es el máximo, proporcional para el resto)
      int alturaPadre = (mayorIngreso > 0)
          ? ((ingresoTotalMes / mayorIngreso) * 200).toInt()
          : 0;

      List<Map<String, dynamic>> categoriasList = [];

      // Asignar valores a cada categoría dentro del mes
      data['categorias'].forEach((categoria, ingresoPorCategoria) {
        // Calcular altura proporcional a la categoría con respecto a la alturaPadre
        int altura = (ingresoTotalMes > 0)
            ? ((ingresoPorCategoria / ingresoTotalMes) * alturaPadre).toInt()
            : 0;

        // Obtener el color asignado a la categoría
        Color colorAsignado = categoriaColorMap[categoria]!;

        // Guardar cada categoría en su propia lista para AppState hijo
        listaCategoriasHistorico.add({
          'fecha': mesAnio,
          'categoria': categoria,
          'ingresoPorCategoria': ingresoPorCategoria,
          'color': colorAsignado,
          'altura': altura,
        });

        categoriasList.add({
          'categoria': categoria,
          'ingresoPorCategoria': ingresoPorCategoria,
          'color': colorAsignado,
          'altura': altura,
        });
      });

      // Guardar el mes y sus categorías en la lista de AppState padre
      listaMesesHistorico.add({
        'fecha': mesAnio,
        'ingresoTotalMes': ingresoTotalMes,
        'alturaDataType': alturaPadre,
        'categoriasDataType': categoriasList,
      });
    }

    // 2. Procesamiento de datos para el gráfico de ingreso por categoría (condicionado por periodos)
    // Obtener los períodos seleccionados desde la App State
    List<String> seleccionPeriodos = FFAppState().seleccionPeriodos;

    // Verificar que hay períodos seleccionados
    if (seleccionPeriodos.isEmpty) {
      print('PROCESAR DATOS INGRESO: No hay períodos seleccionados.');
      // Puedes decidir si quieres retornar o continuar con todos los datos
      // return;
    }

    // Mapear los nombres de meses a números de meses
    Map<String, int> mesesMap = {
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
      // Agregar abreviaturas si es necesario
      'Ene': 1,
      'Feb': 2,
      'Mar': 3,
      'Abr': 4,
      'May': 5,
      'Jun': 6,
      'Jul': 7,
      'Ago': 8,
      'Sep': 9,
      'Oct': 10,
      'Nov': 11,
      'Dic': 12,
    };

    // Convertir los períodos seleccionados a rangos de fechas
    List<Map<String, DateTime>> rangosDeFechas = [];

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
        print('PROCESAR DATOS INGRESO: Formato de mes inválido: $mesAnio');
        continue;
      }

      int? mesNumero = mesesMap[mesTexto];

      if (mesNumero == null) {
        print('PROCESAR DATOS INGRESO: Mes inválido: $mesTexto');
        continue;
      }

      DateTime inicio = DateTime(year, mesNumero, 1);
      DateTime fin;
      if (mesNumero == 12) {
        fin = DateTime(year + 1, 1, 0, 23, 59, 59);
      } else {
        fin = DateTime(year, mesNumero + 1, 0, 23, 59, 59);
      }

      rangosDeFechas.add({'inicio': inicio, 'fin': fin});
    }

    // Verificar que tenemos al menos un rango de fechas válido
    if (rangosDeFechas.isEmpty) {
      print(
          'PROCESAR DATOS INGRESO: No se pudieron obtener rangos de fechas válidos.');
      // Puedes decidir si quieres retornar o continuar con todos los datos
      // return;
    }

    // Reiniciar totalIngresoSeleccionado y categoriasTotales
    totalIngresoSeleccionado = 0.0;
    categoriasTotales.forEach((key, value) {
      value['ingresoAbs'] = 0.0;
    });

    // Filtrar transacciones dentro de los periodos seleccionados y actualizar categoriasTotales
    for (var transaccion in transaccionesIngreso) {
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
          double monto = transaccion.monto ?? 0.0;

          // Sumar el monto al total de ingresos seleccionados
          totalIngresoSeleccionado += monto;

          // Sumar el monto a la categoría correspondiente
          categoriasTotales[categoria]!['ingresoAbs'] += monto;
        } catch (e) {
          print('PROCESAR DATOS INGRESO: Error al procesar transacción: $e');
          continue;
        }
      }
    }

    // Verificar que totalIngresoSeleccionado no sea cero para evitar división por cero
    if (totalIngresoSeleccionado == 0.0) {
      print('PROCESAR DATOS INGRESO: El total de ingresos es cero.');
      // Puedes decidir si quieres retornar o continuar
      // return;
    }

    // Calcular el porcentaje de ingreso por categoría y la altura gráfica
    categoriasTotales.forEach((categoria, data) {
      double ingresoAbs = data['ingresoAbs'];
      double porcentajeIngreso = ingresoAbs / totalIngresoSeleccionado;
      int heightInPx = (porcentajeIngreso * 350).toInt();

      // Obtener el color asignado a la categoría
      Color colorAsignado = categoriaColorMap[categoria]!;

      if (ingresoAbs > 0) {
        listaGraficoIngreso.add({
          'categoria': categoria,
          'ingresoAbs': ingresoAbs,
          'porcentajeIngreso': porcentajeIngreso,
          'ingresoPx': heightInPx,
          'color': colorAsignado,
        });
      }
    });

    // Almacenar los detalles en la App State
    FFAppState().graficoIngresoPorCategoria = listaGraficoIngreso
        .map((e) => GraficoCategoriasIngresoStruct(
              categoria: e['categoria'] as String,
              ingresoPorCategoriaAbs: e['ingresoAbs'] as double,
              porcentajeIngresoPorCategoria: e['porcentajeIngreso'] as double,
              ingresoPorCategoriaPX: e['ingresoPx'] as int,
              color: e['color'] as Color,
            ))
        .toList();

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

    print('PROCESAR DATOS INGRESO: Datos almacenados en la AppState');
  } catch (e) {
    print('PROCESAR DATOS INGRESO: Error: $e');
  }
}
