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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Función principal
Future<void> obtenerYProcesarTransaccionesCompletas() async {
  try {
    print('Iniciando la obtención y procesamiento de transacciones.');

    // 1. Obtener el UID del usuario autenticado
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception('No hay usuario autenticado');
    }
    print('UID del usuario autenticado: $uid');

    // 2. Actualizar los cachés de Categorías, Cuentas y Etiquetas
    await actualizarCacheCategorias(uid);
    await actualizarCacheCuentas(uid);
    await actualizarCacheEtiquetas(uid);
    print('Cachés actualizados.');

    // 3. Obtener el último timestamp almacenado en FFAppState
    // Convertir el último timestamp a DateTime
    print(
        'Valor de FFAppState().ultimoTimestampTransaccion: ${FFAppState().ultimoTimestampTransaccion}');
    DateTime ultimoDateTime;
    if (FFAppState().ultimoTimestampTransaccion != null &&
        FFAppState().ultimoTimestampTransaccion!.isNotEmpty) {
      try {
        ultimoDateTime =
            DateTime.parse(FFAppState().ultimoTimestampTransaccion!);
      } catch (e) {
        print('Error al parsear ultimoTimestampTransaccion: $e');
        // En caso de error, asignamos una fecha por defecto
        ultimoDateTime = DateTime(1970, 1, 1);
      }
    } else {
      ultimoDateTime = DateTime(1970, 1, 1);
    }
    Timestamp ultimoTimestamp = Timestamp.fromDate(ultimoDateTime);
    print('Último timestamp procesado: $ultimoDateTime');

    // 4. Construir la consulta a Firebase para obtener transacciones nuevas o actualizadas
    Query query = FirebaseFirestore.instance
        .collection('Transacciones')
        .where('uid', isEqualTo: uid)
        .where('timestamp', isGreaterThan: ultimoTimestamp);

    print(
        'Ejecutando consulta para obtener transacciones nuevas o actualizadas...');
    QuerySnapshot transaccionesSnapshot = await query.get();

    // 5. Verificar si no hay transacciones nuevas
    if (transaccionesSnapshot.docs.isEmpty) {
      print('No hay transacciones nuevas o actualizadas.');
      return;
    }
    print(
        'Transacciones nuevas o actualizadas encontradas: ${transaccionesSnapshot.docs.length}');

    // 6. Inicializar el maxTimestamp
    DateTime maxTimestamp = ultimoDateTime;

    // 7. Procesar cada transacción
    for (var transDoc in transaccionesSnapshot.docs) {
      Map<String, dynamic> transData = transDoc.data() as Map<String, dynamic>;
      String transaccionId = transDoc.id; // Obtenemos el ID de la transacción
      print('Procesando transacción ID: $transaccionId');

      // a. Verificar si la transacción ha sido eliminada
      bool eliminada = transData['eliminada'] ?? false;
      String movimiento = transData['movimiento'] ?? '';

      if (eliminada) {
        // Eliminar la transacción de FFAppState
        eliminarTransaccionDeAppState(transaccionId, movimiento);
        print('Transacción eliminada de FFAppState: ID $transaccionId');

        // Eliminar el documento de Firebase
        await FirebaseFirestore.instance
            .collection('Transacciones')
            .doc(transaccionId)
            .delete();
        print(
            'Documento de transacción eliminado de Firebase: ID $transaccionId');

        continue; // Saltar al siguiente documento
      }

      // b. Obtener el DocumentReference de la cuenta
      DocumentReference? docRefCuenta =
          transData['cuenta'] as DocumentReference?;

      // c. Obtener el DocumentReference de la categoría
      DocumentReference? docRefCategoria =
          transData['categoria'] as DocumentReference?;

      // d. Obtener el DocumentReference de la cuenta de crédito
      DocumentReference? docRefCuentaCredito =
          transData['cuentaCredito'] as DocumentReference?;

      // e. Obtener el DocumentReference de la etiqueta
      DocumentReference? docRefEtiqueta =
          transData['etiqueta'] as DocumentReference?;

      // f. Resolver y actualizar la categoría
      final categoriaData =
          await obtenerCategoria(docRefCategoria, FFAppState().cacheCategorias);

      // g. Resolver y actualizar la cuenta
      final cuentaData =
          await obtenerCuenta(docRefCuenta, FFAppState().cacheCuentas);

      // h. Resolver y actualizar la cuenta de crédito
      final cuentaCreditoData =
          await obtenerCuenta(docRefCuentaCredito, FFAppState().cacheCuentas);

      // i. Resolver y actualizar la etiqueta
      final etiquetaData =
          await obtenerEtiqueta(docRefEtiqueta, FFAppState().cacheEtiquetas);

      // j. Obtener el nombre de la categoría
      String? categoriaNombre = categoriaData.categoria;
      if (etiquetaData.categoria != null) {
        DocumentReference categoriaRef = etiquetaData.categoria!;
        int catIndex = FFAppState()
            .cacheCategorias
            .indexWhere((c) => c.id == categoriaRef.id);
        if (catIndex >= 0) {
          categoriaNombre = FFAppState().cacheCategorias[catIndex].categoria;
        } else {
          // La categoría no está en el caché, obtenerla
          final categoriaObtenida = await obtenerCategoria(
              categoriaRef, FFAppState().cacheCategorias);
          categoriaNombre = categoriaObtenida.categoria;
        }
      }

      // k. Crear el objeto de transacción como Map<String, dynamic>
      Map<String, dynamic> transaccion = {
        'fecha': (transData['fecha'] as Timestamp?)?.toDate().toIso8601String(),
        'movimiento': transData['movimiento'] ?? '',
        'monto': double.tryParse(transData['monto']?.toString() ?? '') ?? 0.0,
        'cuenta': cuentaData.cuenta,
        'categoria': categoriaNombre,
        'etiqueta': etiquetaData.etiqueta,
        'observacion': transData['observacion'],
        'cuentaCredito': cuentaCreditoData.cuenta,
        'montoAhorro':
            double.tryParse(transData['montoAhorro']?.toString() ?? '') ?? 0.0,
        'montoDivisa':
            double.tryParse(transData['montoDivisa']?.toString() ?? '') ?? 0.0,
        'desahorro': transData['desahorro'] ?? false,
        'timestamp':
            (transData['timestamp'] as Timestamp?)?.toDate().toIso8601String(),
        'docRefTransac': FirebaseFirestore.instance
            .collection('Transacciones')
            .doc(transaccionId),
        'docRefCuenta': docRefCuenta,
        'docRefCategoria': docRefCategoria,
        'docRefCuentaCredito': docRefCuentaCredito,
        'docRefEtiqueta': docRefEtiqueta,
      };
      print('Transacción procesada: $transaccion');

      // l. Convertir el Map en TotalidadDeTransaccionesStruct usando la función actualizada
      final transaccionStruct =
          mapToTotalidadDeTransacciones(transaccion, transaccionId);

      // Determinar si divisaBool es true o false
      // divisaBool debe ser true si O la cuenta o la cuentaCredito tienen divisa != "$ARS"
      bool divisaBoolVal = false;

      if ((cuentaData.divisa != null && cuentaData.divisa != '\$ARS') ||
          (cuentaCreditoData.divisa != null &&
              cuentaCreditoData.divisa != '\$ARS')) {
        divisaBoolVal = true;
      }

      // Asignamos el valor a divisaBool en el struct
      transaccionStruct.divisaBool = divisaBoolVal;

      // m. Agregar o actualizar la transacción en la lista correspondiente en FFAppState
      switch ((transaccion['movimiento'] as String).toLowerCase()) {
        case 'ahorro':
          int index = FFAppState()
              .transaccionesAhorro
              .indexWhere((t) => t.idTransaccion == transaccionId);
          if (index == -1) {
            final updatedList = List<TotalidadDeTransaccionesStruct>.from(
                FFAppState().transaccionesAhorro);
            updatedList.add(transaccionStruct);
            FFAppState().transaccionesAhorro = updatedList;
            print('Transacción agregada a transaccionesAhorro.');
          } else {
            final updatedList = List<TotalidadDeTransaccionesStruct>.from(
                FFAppState().transaccionesAhorro);
            updatedList[index] = transaccionStruct;
            FFAppState().transaccionesAhorro = updatedList;
            print('Transacción actualizada en transaccionesAhorro.');
          }
          break;
        case 'gasto':
          int index = FFAppState()
              .transaccionesGasto
              .indexWhere((t) => t.idTransaccion == transaccionId);
          if (index == -1) {
            final updatedList = List<TotalidadDeTransaccionesStruct>.from(
                FFAppState().transaccionesGasto);
            updatedList.add(transaccionStruct);
            FFAppState().transaccionesGasto = updatedList;
            print('Transacción agregada a transaccionesGasto.');
          } else {
            final updatedList = List<TotalidadDeTransaccionesStruct>.from(
                FFAppState().transaccionesGasto);
            updatedList[index] = transaccionStruct;
            FFAppState().transaccionesGasto = updatedList;
            print('Transacción actualizada en transaccionesGasto.');
          }
          break;
        case 'traspaso':
          int index = FFAppState()
              .transaccionesTraspaso
              .indexWhere((t) => t.idTransaccion == transaccionId);
          if (index == -1) {
            final updatedList = List<TotalidadDeTransaccionesStruct>.from(
                FFAppState().transaccionesTraspaso);
            updatedList.add(transaccionStruct);
            FFAppState().transaccionesTraspaso = updatedList;
            print('Transacción agregada a transaccionesTraspaso.');
          } else {
            final updatedList = List<TotalidadDeTransaccionesStruct>.from(
                FFAppState().transaccionesTraspaso);
            updatedList[index] = transaccionStruct;
            FFAppState().transaccionesTraspaso = updatedList;
            print('Transacción actualizada en transaccionesTraspaso.');
          }
          break;
        case 'ingreso':
          int index = FFAppState()
              .transaccionesIngreso
              .indexWhere((t) => t.idTransaccion == transaccionId);
          if (index == -1) {
            final updatedList = List<TotalidadDeTransaccionesStruct>.from(
                FFAppState().transaccionesIngreso);
            updatedList.add(transaccionStruct);
            FFAppState().transaccionesIngreso = updatedList;
            print('Transacción agregada a transaccionesIngreso.');
          } else {
            final updatedList = List<TotalidadDeTransaccionesStruct>.from(
                FFAppState().transaccionesIngreso);
            updatedList[index] = transaccionStruct;
            FFAppState().transaccionesIngreso = updatedList;
            print('Transacción actualizada en transaccionesIngreso.');
          }
          break;
        case 'ajuste':
          int index = FFAppState()
              .transaccionesAjuste
              .indexWhere((t) => t.idTransaccion == transaccionId);
          if (index == -1) {
            final updatedList = List<TotalidadDeTransaccionesStruct>.from(
                FFAppState().transaccionesAjuste);
            updatedList.add(transaccionStruct);
            FFAppState().transaccionesAjuste = updatedList;
            print('Transacción agregada a transaccionesAjuste.');
          } else {
            final updatedList = List<TotalidadDeTransaccionesStruct>.from(
                FFAppState().transaccionesAjuste);
            updatedList[index] = transaccionStruct;
            FFAppState().transaccionesAjuste = updatedList;
            print('Transacción actualizada en transaccionesAjuste.');
          }
          break;
        default:
          print('Movimiento desconocido: ${transaccion['movimiento']}');
      }

      // n. Actualizar maxTimestamp
      DateTime? transTimestamp =
          (transData['timestamp'] as Timestamp?)?.toDate();
      if (transTimestamp != null && transTimestamp.isAfter(maxTimestamp)) {
        maxTimestamp = transTimestamp;
        print('maxTimestamp actualizado a: $maxTimestamp');
      }
    }

    // 8. Actualizar el último timestamp en FFAppState
    FFAppState().ultimoTimestampTransaccion = maxTimestamp.toIso8601String();
    print(
        'Último timestamp actualizado en FFAppState: ${FFAppState().ultimoTimestampTransaccion}');

    print('Transacciones actualizadas exitosamente.');
  } catch (e, stackTrace) {
    print('Error al obtener transacciones: $e');
    print(stackTrace);
  }
}

// Implementación de la función eliminarTransaccionDeAppState
void eliminarTransaccionDeAppState(String transaccionId, String movimiento) {
  switch (movimiento.toLowerCase()) {
    case 'ahorro':
      FFAppState().transaccionesAhorro = FFAppState()
          .transaccionesAhorro
          .where((t) => t.idTransaccion != transaccionId)
          .toList();
      print('Transacción eliminada de transaccionesAhorro: $transaccionId');
      break;
    case 'gasto':
      FFAppState().transaccionesGasto = FFAppState()
          .transaccionesGasto
          .where((t) => t.idTransaccion != transaccionId)
          .toList();
      print('Transacción eliminada de transaccionesGasto: $transaccionId');
      break;
    case 'traspaso':
      FFAppState().transaccionesTraspaso = FFAppState()
          .transaccionesTraspaso
          .where((t) => t.idTransaccion != transaccionId)
          .toList();
      print('Transacción eliminada de transaccionesTraspaso: $transaccionId');
      break;
    case 'ingreso':
      FFAppState().transaccionesIngreso = FFAppState()
          .transaccionesIngreso
          .where((t) => t.idTransaccion != transaccionId)
          .toList();
      print('Transacción eliminada de transaccionesIngreso: $transaccionId');
      break;
    case 'ajuste':
      FFAppState().transaccionesAjuste = FFAppState()
          .transaccionesAjuste
          .where((t) => t.idTransaccion != transaccionId)
          .toList();
      print('Transacción eliminada de transaccionesAjuste: $transaccionId');
      break;
    default:
      print('Movimiento desconocido al eliminar transacción: $movimiento');
      return;
  }
}

// Función interna para convertir un Map en TotalidadDeTransaccionesStruct
TotalidadDeTransaccionesStruct mapToTotalidadDeTransacciones(
    Map<String, dynamic> data, String idTransaccion) {
  DocumentReference docRefTransac =
      FirebaseFirestore.instance.collection('Transacciones').doc(idTransaccion);

  DocumentReference? docRefCuenta = data['docRefCuenta'] as DocumentReference?;
  DocumentReference? docRefCategoria =
      data['docRefCategoria'] as DocumentReference?;
  DocumentReference? docRefCuentaCredito =
      data['docRefCuentaCredito'] as DocumentReference?;
  DocumentReference? docRefEtiqueta =
      data['docRefEtiqueta'] as DocumentReference?;

  // Se asume que divisaBool existe en TotalidadDeTransaccionesStruct.
  // Inicialmente lo ponemos en false, se ajustará luego.
  return TotalidadDeTransaccionesStruct(
    idTransaccion: idTransaccion,
    fecha: data['fecha'] as String?,
    movimiento: data['movimiento'] as String?,
    monto: data['monto'] as double?,
    cuenta: data['cuenta'] as String?,
    categoria: data['categoria'] as String?,
    etiqueta: data['etiqueta'] as String?,
    observacion: data['observacion'] as String?,
    cuentaCredito: data['cuentaCredito'] as String?,
    montoAhorro: data['montoAhorro'] as double?,
    montoDivisa: data['montoDivisa'] as double?,
    desahorro: data['desahorro'] as bool?,
    timestamp: data['timestamp'] as String?,
    docRefTransac: docRefTransac,
    docRefCuenta: docRefCuenta,
    docRefCategoria: docRefCategoria,
    docRefCuentaCredito: docRefCuentaCredito,
    docRefEtiqueta: docRefEtiqueta,
    divisaBool: false, // Se asignará posteriormente en el flujo principal
  );
}

// Función para actualizar el caché de Categorías
Future<void> actualizarCacheCategorias(String uid) async {
  print('Actualizando caché de Categorías...');
  QuerySnapshot categoriasSnapshot = await FirebaseFirestore.instance
      .collection('Categorias')
      .where('uid', isEqualTo: uid)
      .get();

  for (var doc in categoriasSnapshot.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final categoria = mapToCategoriasCacheStruct(data, doc.id);

    int index =
        FFAppState().cacheCategorias.indexWhere((c) => c.id == categoria.id);

    if (index == -1) {
      final updatedList =
          List<CategoriasCacheStructStruct>.from(FFAppState().cacheCategorias);
      updatedList.add(categoria);
      FFAppState().cacheCategorias = updatedList;
      print('Categoría agregada al caché: ${categoria.categoria}');
    } else {
      final cachedCategoria = FFAppState().cacheCategorias[index];

      bool hasChanges = false;

      if (cachedCategoria.logo != categoria.logo ||
          cachedCategoria.categoria != categoria.categoria ||
          cachedCategoria.activa != categoria.activa ||
          cachedCategoria.movimiento != categoria.movimiento ||
          cachedCategoria.presupuesto != categoria.presupuesto) {
        hasChanges = true;
      }

      if (hasChanges) {
        final updatedList = List<CategoriasCacheStructStruct>.from(
            FFAppState().cacheCategorias);
        updatedList[index] = categoria;
        FFAppState().cacheCategorias = updatedList;
        print('Categoría actualizada en el caché: ${categoria.categoria}');
      } else {
        print(
            'La categoría en el caché está actualizada: ${categoria.categoria}');
      }
    }
  }
  print('Caché de Categorías actualizado.');
}

// Función para actualizar el caché de Cuentas
Future<void> actualizarCacheCuentas(String uid) async {
  print('Actualizando caché de Cuentas...');
  QuerySnapshot cuentasSnapshot = await FirebaseFirestore.instance
      .collection('Cuentas')
      .where('uid', isEqualTo: uid)
      .get();

  for (var doc in cuentasSnapshot.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final cuenta = mapToCuentaCacheStruct(data, doc.id);

    int index = FFAppState().cacheCuentas.indexWhere((c) => c.id == cuenta.id);

    if (index == -1) {
      final updatedList =
          List<CuentaCacheStructStruct>.from(FFAppState().cacheCuentas);
      updatedList.add(cuenta);
      FFAppState().cacheCuentas = updatedList;
      print('Cuenta agregada al caché: ${cuenta.cuenta}');
    } else {
      final cachedCuenta = FFAppState().cacheCuentas[index];

      bool hasChanges = false;

      if (cachedCuenta.logo != cuenta.logo ||
          cachedCuenta.cuenta != cuenta.cuenta ||
          cachedCuenta.activa != cuenta.activa ||
          cachedCuenta.ahorro != cuenta.ahorro ||
          cachedCuenta.divisa != cuenta.divisa ||
          cachedCuenta.ppp != cuenta.ppp ||
          cachedCuenta.tap != cuenta.tap ||
          cachedCuenta.tad != cuenta.tad) {
        hasChanges = true;
      }

      final updatedCuenta = CuentaCacheStructStruct(
        id: cachedCuenta.id,
        cuenta: hasChanges ? cuenta.cuenta : cachedCuenta.cuenta,
        logo: hasChanges ? cuenta.logo : cachedCuenta.logo,
        activa: hasChanges ? cuenta.activa : cachedCuenta.activa,
        ahorro: hasChanges ? cuenta.ahorro : cachedCuenta.ahorro,
        divisa: hasChanges ? cuenta.divisa : cachedCuenta.divisa,
        ppp: cuenta.ppp,
        tap: cuenta.tap,
        tad: cuenta.tad,
      );

      final updatedList =
          List<CuentaCacheStructStruct>.from(FFAppState().cacheCuentas);
      updatedList[index] = updatedCuenta;
      FFAppState().cacheCuentas = updatedList;

      if (hasChanges) {
        print('Cuenta actualizada en el caché: ${cuenta.cuenta}');
      } else {
        print(
            'Campos ppp, tap y tad actualizados en el caché para la cuenta: ${cuenta.cuenta}');
      }
    }
  }
  print('Caché de Cuentas actualizado.');
}

// Función para actualizar el caché de Etiquetas
Future<void> actualizarCacheEtiquetas(String uid) async {
  print('Actualizando caché de Etiquetas...');
  QuerySnapshot etiquetasSnapshot = await FirebaseFirestore.instance
      .collection('Etiquetas')
      .where('uid', isEqualTo: uid)
      .get();

  for (var doc in etiquetasSnapshot.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final etiqueta = mapToEtiquetaCacheStruct(data, doc.id);

    int index =
        FFAppState().cacheEtiquetas.indexWhere((e) => e.id == etiqueta.id);

    if (index == -1) {
      final updatedList =
          List<EtiquetaCacheStructStruct>.from(FFAppState().cacheEtiquetas);
      updatedList.add(etiqueta);
      FFAppState().cacheEtiquetas = updatedList;
      print('Etiqueta agregada al caché: ${etiqueta.etiqueta}');
    } else {
      final cachedEtiqueta = FFAppState().cacheEtiquetas[index];

      bool hasChanges = false;

      if (cachedEtiqueta.etiqueta != etiqueta.etiqueta ||
          cachedEtiqueta.activa != etiqueta.activa ||
          cachedEtiqueta.categoria?.id != etiqueta.categoria?.id) {
        hasChanges = true;
      }

      if (hasChanges) {
        final updatedList =
            List<EtiquetaCacheStructStruct>.from(FFAppState().cacheEtiquetas);
        updatedList[index] = etiqueta;
        FFAppState().cacheEtiquetas = updatedList;
        print('Etiqueta actualizada en el caché: ${etiqueta.etiqueta}');
      } else {
        print('La etiqueta en el caché está actualizada: ${etiqueta.etiqueta}');
      }
    }
  }
  print('Caché de Etiquetas actualizado.');
}

// Función interna para convertir un Map en CuentaCacheStructStruct
CuentaCacheStructStruct mapToCuentaCacheStruct(
    Map<String, dynamic> data, String id) {
  return CuentaCacheStructStruct(
    id: id,
    cuenta: data['cuenta'] as String?,
    logo: data['logo'] as String?,
    activa: data['activa'] as bool?,
    ahorro: data['ahorro'] as bool?,
    divisa: data['divisa'] as String?,
    ppp: double.tryParse(data['ppp']?.toString() ?? '') ?? 0.0,
    tap: double.tryParse(data['tap']?.toString() ?? '') ?? 0.0,
    tad: double.tryParse(data['tad']?.toString() ?? '') ?? 0.0,
  );
}

// Función interna para convertir un Map en CategoriasCacheStructStruct
CategoriasCacheStructStruct mapToCategoriasCacheStruct(
    Map<String, dynamic> data, String id) {
  return CategoriasCacheStructStruct(
    id: id,
    movimiento: data['movimiento'] as String?,
    categoria: data['categoria'] as String?,
    logo: data['logo'] as String?,
    presupuesto: double.tryParse(data['presupuesto']?.toString() ?? '') ?? 0.0,
    activa: data['activa'] as bool?,
  );
}

// Función interna para convertir un Map en EtiquetaCacheStructStruct
EtiquetaCacheStructStruct mapToEtiquetaCacheStruct(
    Map<String, dynamic> data, String id) {
  DocumentReference? categoriaRef;
  if (data['categoria'] != null && data['categoria'] is DocumentReference) {
    categoriaRef = data['categoria'] as DocumentReference?;
  } else {
    categoriaRef = null;
  }

  return EtiquetaCacheStructStruct(
    id: id,
    categoria: categoriaRef,
    etiqueta: data['etiqueta'] as String?,
    activa: data['activa'] as bool?,
  );
}

// Función para resolver y actualizar la categoría
Future<CategoriasCacheStructStruct> obtenerCategoria(
    DocumentReference? categoriaRef,
    List<CategoriasCacheStructStruct> cacheCategorias) async {
  if (categoriaRef == null) {
    return CategoriasCacheStructStruct(
      id: '',
      movimiento: '',
      categoria: '',
      logo: '',
      presupuesto: 0.0,
      activa: false,
    );
  }

  String categoriaId = categoriaRef.id;

  int index = cacheCategorias.indexWhere((c) => c.id == categoriaId);

  if (index >= 0) {
    final categoriaCache = cacheCategorias[index];
    print('Categoría encontrada en caché: ${categoriaCache.categoria}');
    return categoriaCache;
  } else {
    print('Categoría no encontrada en caché. Obteniendo de Firebase...');
    DocumentSnapshot categoriaDoc = await categoriaRef.get();
    Map<String, dynamic> data = categoriaDoc.data() as Map<String, dynamic>;

    final categoriaActual = mapToCategoriasCacheStruct(data, categoriaId);

    final updatedList =
        List<CategoriasCacheStructStruct>.from(FFAppState().cacheCategorias);
    updatedList.add(categoriaActual);
    FFAppState().cacheCategorias = updatedList;
    print('Categoría agregada al caché: ${categoriaActual.categoria}');
    return categoriaActual;
  }
}

// Función para resolver y actualizar la cuenta
Future<CuentaCacheStructStruct> obtenerCuenta(DocumentReference? cuentaRef,
    List<CuentaCacheStructStruct> cacheCuentas) async {
  if (cuentaRef == null) {
    return CuentaCacheStructStruct(
      id: '',
      cuenta: '',
      logo: '',
      activa: false,
      ahorro: false,
      divisa: '',
      ppp: 0.0,
      tap: 0.0,
      tad: 0.0,
    );
  }

  String cuentaId = cuentaRef.id;

  DocumentSnapshot cuentaDoc = await cuentaRef.get();
  Map<String, dynamic> data = cuentaDoc.data() as Map<String, dynamic>;
  final cuentaActualizada = mapToCuentaCacheStruct(data, cuentaId);

  int index = cacheCuentas.indexWhere((c) => c.id == cuentaId);

  if (index >= 0) {
    final cachedCuenta = cacheCuentas[index];

    bool hasChanges = false;

    if (cachedCuenta.logo != cuentaActualizada.logo ||
        cachedCuenta.cuenta != cuentaActualizada.cuenta ||
        cachedCuenta.activa != cuentaActualizada.activa ||
        cachedCuenta.ahorro != cuentaActualizada.ahorro ||
        cachedCuenta.divisa != cuentaActualizada.divisa) {
      hasChanges = true;
    }

    final updatedCuenta = CuentaCacheStructStruct(
      id: cachedCuenta.id,
      cuenta: hasChanges ? cuentaActualizada.cuenta : cachedCuenta.cuenta,
      logo: hasChanges ? cuentaActualizada.logo : cachedCuenta.logo,
      activa: hasChanges ? cuentaActualizada.activa : cachedCuenta.activa,
      ahorro: hasChanges ? cuentaActualizada.ahorro : cachedCuenta.ahorro,
      divisa: hasChanges ? cuentaActualizada.divisa : cachedCuenta.divisa,
      ppp: cuentaActualizada.ppp,
      tap: cuentaActualizada.tap,
      tad: cuentaActualizada.tad,
    );

    final updatedList = List<CuentaCacheStructStruct>.from(cacheCuentas);
    updatedList[index] = updatedCuenta;
    FFAppState().cacheCuentas = updatedList;

    if (hasChanges) {
      print('Cuenta actualizada en el caché: ${updatedCuenta.cuenta}');
    } else {
      print(
          'Campos ppp, tap y tad actualizados en el caché para la cuenta: ${updatedCuenta.cuenta}');
    }

    return updatedCuenta;
  } else {
    final updatedList = List<CuentaCacheStructStruct>.from(cacheCuentas);
    updatedList.add(cuentaActualizada);
    FFAppState().cacheCuentas = updatedList;
    print('Cuenta agregada al caché: ${cuentaActualizada.cuenta}');
    return cuentaActualizada;
  }
}

// Función para resolver y actualizar la etiqueta
Future<EtiquetaCacheStructStruct> obtenerEtiqueta(
    DocumentReference? etiquetaRef,
    List<EtiquetaCacheStructStruct> cacheEtiquetas) async {
  if (etiquetaRef == null) {
    return EtiquetaCacheStructStruct(
      id: '',
      categoria: null,
      etiqueta: '',
      activa: false,
    );
  }

  String etiquetaId = etiquetaRef.id;

  int index = cacheEtiquetas.indexWhere((e) => e.id == etiquetaId);

  if (index >= 0) {
    final etiquetaCache = cacheEtiquetas[index];
    print('Etiqueta encontrada en caché: ${etiquetaCache.etiqueta}');
    return etiquetaCache;
  } else {
    print('Etiqueta no encontrada en caché. Obteniendo de Firebase...');
    DocumentSnapshot etiquetaDoc = await etiquetaRef.get();
    Map<String, dynamic> data = etiquetaDoc.data() as Map<String, dynamic>;

    final etiquetaActual = mapToEtiquetaCacheStruct(data, etiquetaId);

    final updatedList = List<EtiquetaCacheStructStruct>.from(cacheEtiquetas);
    updatedList.add(etiquetaActual);
    FFAppState().cacheEtiquetas = updatedList;
    print('Etiqueta agregada al caché: ${etiquetaActual.etiqueta}');
    return etiquetaActual;
  }
}
