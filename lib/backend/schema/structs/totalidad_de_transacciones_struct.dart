// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TotalidadDeTransaccionesStruct extends FFFirebaseStruct {
  TotalidadDeTransaccionesStruct({
    String? movimiento,
    double? monto,
    String? cuenta,
    String? categoria,
    String? etiqueta,
    String? observacion,
    String? cuentaCredito,
    double? montoAhorro,
    double? montoDivisa,
    bool? desahorro,
    String? idTransaccion,
    String? fecha,
    String? timestamp,
    DocumentReference? docRefTransac,
    DocumentReference? docRefCuenta,
    DocumentReference? docRefCategoria,
    DocumentReference? docRefCuentaCredito,
    DocumentReference? docRefEtiqueta,
    bool? divisaBool,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _movimiento = movimiento,
        _monto = monto,
        _cuenta = cuenta,
        _categoria = categoria,
        _etiqueta = etiqueta,
        _observacion = observacion,
        _cuentaCredito = cuentaCredito,
        _montoAhorro = montoAhorro,
        _montoDivisa = montoDivisa,
        _desahorro = desahorro,
        _idTransaccion = idTransaccion,
        _fecha = fecha,
        _timestamp = timestamp,
        _docRefTransac = docRefTransac,
        _docRefCuenta = docRefCuenta,
        _docRefCategoria = docRefCategoria,
        _docRefCuentaCredito = docRefCuentaCredito,
        _docRefEtiqueta = docRefEtiqueta,
        _divisaBool = divisaBool,
        super(firestoreUtilData);

  // "movimiento" field.
  String? _movimiento;
  String get movimiento => _movimiento ?? '';
  set movimiento(String? val) => _movimiento = val;

  bool hasMovimiento() => _movimiento != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  set monto(double? val) => _monto = val;

  void incrementMonto(double amount) => monto = monto + amount;

  bool hasMonto() => _monto != null;

  // "cuenta" field.
  String? _cuenta;
  String get cuenta => _cuenta ?? '';
  set cuenta(String? val) => _cuenta = val;

  bool hasCuenta() => _cuenta != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "etiqueta" field.
  String? _etiqueta;
  String get etiqueta => _etiqueta ?? '';
  set etiqueta(String? val) => _etiqueta = val;

  bool hasEtiqueta() => _etiqueta != null;

  // "observacion" field.
  String? _observacion;
  String get observacion => _observacion ?? '';
  set observacion(String? val) => _observacion = val;

  bool hasObservacion() => _observacion != null;

  // "cuentaCredito" field.
  String? _cuentaCredito;
  String get cuentaCredito => _cuentaCredito ?? '';
  set cuentaCredito(String? val) => _cuentaCredito = val;

  bool hasCuentaCredito() => _cuentaCredito != null;

  // "montoAhorro" field.
  double? _montoAhorro;
  double get montoAhorro => _montoAhorro ?? 0.0;
  set montoAhorro(double? val) => _montoAhorro = val;

  void incrementMontoAhorro(double amount) =>
      montoAhorro = montoAhorro + amount;

  bool hasMontoAhorro() => _montoAhorro != null;

  // "montoDivisa" field.
  double? _montoDivisa;
  double get montoDivisa => _montoDivisa ?? 0.0;
  set montoDivisa(double? val) => _montoDivisa = val;

  void incrementMontoDivisa(double amount) =>
      montoDivisa = montoDivisa + amount;

  bool hasMontoDivisa() => _montoDivisa != null;

  // "desahorro" field.
  bool? _desahorro;
  bool get desahorro => _desahorro ?? false;
  set desahorro(bool? val) => _desahorro = val;

  bool hasDesahorro() => _desahorro != null;

  // "idTransaccion" field.
  String? _idTransaccion;
  String get idTransaccion => _idTransaccion ?? '';
  set idTransaccion(String? val) => _idTransaccion = val;

  bool hasIdTransaccion() => _idTransaccion != null;

  // "fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  set fecha(String? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  set timestamp(String? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "docRefTransac" field.
  DocumentReference? _docRefTransac;
  DocumentReference? get docRefTransac => _docRefTransac;
  set docRefTransac(DocumentReference? val) => _docRefTransac = val;

  bool hasDocRefTransac() => _docRefTransac != null;

  // "docRefCuenta" field.
  DocumentReference? _docRefCuenta;
  DocumentReference? get docRefCuenta => _docRefCuenta;
  set docRefCuenta(DocumentReference? val) => _docRefCuenta = val;

  bool hasDocRefCuenta() => _docRefCuenta != null;

  // "docRefCategoria" field.
  DocumentReference? _docRefCategoria;
  DocumentReference? get docRefCategoria => _docRefCategoria;
  set docRefCategoria(DocumentReference? val) => _docRefCategoria = val;

  bool hasDocRefCategoria() => _docRefCategoria != null;

  // "docRefCuentaCredito" field.
  DocumentReference? _docRefCuentaCredito;
  DocumentReference? get docRefCuentaCredito => _docRefCuentaCredito;
  set docRefCuentaCredito(DocumentReference? val) => _docRefCuentaCredito = val;

  bool hasDocRefCuentaCredito() => _docRefCuentaCredito != null;

  // "docRefEtiqueta" field.
  DocumentReference? _docRefEtiqueta;
  DocumentReference? get docRefEtiqueta => _docRefEtiqueta;
  set docRefEtiqueta(DocumentReference? val) => _docRefEtiqueta = val;

  bool hasDocRefEtiqueta() => _docRefEtiqueta != null;

  // "divisaBool" field.
  bool? _divisaBool;
  bool get divisaBool => _divisaBool ?? false;
  set divisaBool(bool? val) => _divisaBool = val;

  bool hasDivisaBool() => _divisaBool != null;

  static TotalidadDeTransaccionesStruct fromMap(Map<String, dynamic> data) =>
      TotalidadDeTransaccionesStruct(
        movimiento: data['movimiento'] as String?,
        monto: castToType<double>(data['monto']),
        cuenta: data['cuenta'] as String?,
        categoria: data['categoria'] as String?,
        etiqueta: data['etiqueta'] as String?,
        observacion: data['observacion'] as String?,
        cuentaCredito: data['cuentaCredito'] as String?,
        montoAhorro: castToType<double>(data['montoAhorro']),
        montoDivisa: castToType<double>(data['montoDivisa']),
        desahorro: data['desahorro'] as bool?,
        idTransaccion: data['idTransaccion'] as String?,
        fecha: data['fecha'] as String?,
        timestamp: data['timestamp'] as String?,
        docRefTransac: data['docRefTransac'] as DocumentReference?,
        docRefCuenta: data['docRefCuenta'] as DocumentReference?,
        docRefCategoria: data['docRefCategoria'] as DocumentReference?,
        docRefCuentaCredito: data['docRefCuentaCredito'] as DocumentReference?,
        docRefEtiqueta: data['docRefEtiqueta'] as DocumentReference?,
        divisaBool: data['divisaBool'] as bool?,
      );

  static TotalidadDeTransaccionesStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? TotalidadDeTransaccionesStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'movimiento': _movimiento,
        'monto': _monto,
        'cuenta': _cuenta,
        'categoria': _categoria,
        'etiqueta': _etiqueta,
        'observacion': _observacion,
        'cuentaCredito': _cuentaCredito,
        'montoAhorro': _montoAhorro,
        'montoDivisa': _montoDivisa,
        'desahorro': _desahorro,
        'idTransaccion': _idTransaccion,
        'fecha': _fecha,
        'timestamp': _timestamp,
        'docRefTransac': _docRefTransac,
        'docRefCuenta': _docRefCuenta,
        'docRefCategoria': _docRefCategoria,
        'docRefCuentaCredito': _docRefCuentaCredito,
        'docRefEtiqueta': _docRefEtiqueta,
        'divisaBool': _divisaBool,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'movimiento': serializeParam(
          _movimiento,
          ParamType.String,
        ),
        'monto': serializeParam(
          _monto,
          ParamType.double,
        ),
        'cuenta': serializeParam(
          _cuenta,
          ParamType.String,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'etiqueta': serializeParam(
          _etiqueta,
          ParamType.String,
        ),
        'observacion': serializeParam(
          _observacion,
          ParamType.String,
        ),
        'cuentaCredito': serializeParam(
          _cuentaCredito,
          ParamType.String,
        ),
        'montoAhorro': serializeParam(
          _montoAhorro,
          ParamType.double,
        ),
        'montoDivisa': serializeParam(
          _montoDivisa,
          ParamType.double,
        ),
        'desahorro': serializeParam(
          _desahorro,
          ParamType.bool,
        ),
        'idTransaccion': serializeParam(
          _idTransaccion,
          ParamType.String,
        ),
        'fecha': serializeParam(
          _fecha,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.String,
        ),
        'docRefTransac': serializeParam(
          _docRefTransac,
          ParamType.DocumentReference,
        ),
        'docRefCuenta': serializeParam(
          _docRefCuenta,
          ParamType.DocumentReference,
        ),
        'docRefCategoria': serializeParam(
          _docRefCategoria,
          ParamType.DocumentReference,
        ),
        'docRefCuentaCredito': serializeParam(
          _docRefCuentaCredito,
          ParamType.DocumentReference,
        ),
        'docRefEtiqueta': serializeParam(
          _docRefEtiqueta,
          ParamType.DocumentReference,
        ),
        'divisaBool': serializeParam(
          _divisaBool,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TotalidadDeTransaccionesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TotalidadDeTransaccionesStruct(
        movimiento: deserializeParam(
          data['movimiento'],
          ParamType.String,
          false,
        ),
        monto: deserializeParam(
          data['monto'],
          ParamType.double,
          false,
        ),
        cuenta: deserializeParam(
          data['cuenta'],
          ParamType.String,
          false,
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        etiqueta: deserializeParam(
          data['etiqueta'],
          ParamType.String,
          false,
        ),
        observacion: deserializeParam(
          data['observacion'],
          ParamType.String,
          false,
        ),
        cuentaCredito: deserializeParam(
          data['cuentaCredito'],
          ParamType.String,
          false,
        ),
        montoAhorro: deserializeParam(
          data['montoAhorro'],
          ParamType.double,
          false,
        ),
        montoDivisa: deserializeParam(
          data['montoDivisa'],
          ParamType.double,
          false,
        ),
        desahorro: deserializeParam(
          data['desahorro'],
          ParamType.bool,
          false,
        ),
        idTransaccion: deserializeParam(
          data['idTransaccion'],
          ParamType.String,
          false,
        ),
        fecha: deserializeParam(
          data['fecha'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.String,
          false,
        ),
        docRefTransac: deserializeParam(
          data['docRefTransac'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Transacciones'],
        ),
        docRefCuenta: deserializeParam(
          data['docRefCuenta'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Cuentas'],
        ),
        docRefCategoria: deserializeParam(
          data['docRefCategoria'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Categorias'],
        ),
        docRefCuentaCredito: deserializeParam(
          data['docRefCuentaCredito'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Cuentas'],
        ),
        docRefEtiqueta: deserializeParam(
          data['docRefEtiqueta'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Etiquetas'],
        ),
        divisaBool: deserializeParam(
          data['divisaBool'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TotalidadDeTransaccionesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TotalidadDeTransaccionesStruct &&
        movimiento == other.movimiento &&
        monto == other.monto &&
        cuenta == other.cuenta &&
        categoria == other.categoria &&
        etiqueta == other.etiqueta &&
        observacion == other.observacion &&
        cuentaCredito == other.cuentaCredito &&
        montoAhorro == other.montoAhorro &&
        montoDivisa == other.montoDivisa &&
        desahorro == other.desahorro &&
        idTransaccion == other.idTransaccion &&
        fecha == other.fecha &&
        timestamp == other.timestamp &&
        docRefTransac == other.docRefTransac &&
        docRefCuenta == other.docRefCuenta &&
        docRefCategoria == other.docRefCategoria &&
        docRefCuentaCredito == other.docRefCuentaCredito &&
        docRefEtiqueta == other.docRefEtiqueta &&
        divisaBool == other.divisaBool;
  }

  @override
  int get hashCode => const ListEquality().hash([
        movimiento,
        monto,
        cuenta,
        categoria,
        etiqueta,
        observacion,
        cuentaCredito,
        montoAhorro,
        montoDivisa,
        desahorro,
        idTransaccion,
        fecha,
        timestamp,
        docRefTransac,
        docRefCuenta,
        docRefCategoria,
        docRefCuentaCredito,
        docRefEtiqueta,
        divisaBool
      ]);
}

TotalidadDeTransaccionesStruct createTotalidadDeTransaccionesStruct({
  String? movimiento,
  double? monto,
  String? cuenta,
  String? categoria,
  String? etiqueta,
  String? observacion,
  String? cuentaCredito,
  double? montoAhorro,
  double? montoDivisa,
  bool? desahorro,
  String? idTransaccion,
  String? fecha,
  String? timestamp,
  DocumentReference? docRefTransac,
  DocumentReference? docRefCuenta,
  DocumentReference? docRefCategoria,
  DocumentReference? docRefCuentaCredito,
  DocumentReference? docRefEtiqueta,
  bool? divisaBool,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TotalidadDeTransaccionesStruct(
      movimiento: movimiento,
      monto: monto,
      cuenta: cuenta,
      categoria: categoria,
      etiqueta: etiqueta,
      observacion: observacion,
      cuentaCredito: cuentaCredito,
      montoAhorro: montoAhorro,
      montoDivisa: montoDivisa,
      desahorro: desahorro,
      idTransaccion: idTransaccion,
      fecha: fecha,
      timestamp: timestamp,
      docRefTransac: docRefTransac,
      docRefCuenta: docRefCuenta,
      docRefCategoria: docRefCategoria,
      docRefCuentaCredito: docRefCuentaCredito,
      docRefEtiqueta: docRefEtiqueta,
      divisaBool: divisaBool,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TotalidadDeTransaccionesStruct? updateTotalidadDeTransaccionesStruct(
  TotalidadDeTransaccionesStruct? totalidadDeTransacciones, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    totalidadDeTransacciones
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTotalidadDeTransaccionesStructData(
  Map<String, dynamic> firestoreData,
  TotalidadDeTransaccionesStruct? totalidadDeTransacciones,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (totalidadDeTransacciones == null) {
    return;
  }
  if (totalidadDeTransacciones.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      totalidadDeTransacciones.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final totalidadDeTransaccionesData = getTotalidadDeTransaccionesFirestoreData(
      totalidadDeTransacciones, forFieldValue);
  final nestedData =
      totalidadDeTransaccionesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      totalidadDeTransacciones.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTotalidadDeTransaccionesFirestoreData(
  TotalidadDeTransaccionesStruct? totalidadDeTransacciones, [
  bool forFieldValue = false,
]) {
  if (totalidadDeTransacciones == null) {
    return {};
  }
  final firestoreData = mapToFirestore(totalidadDeTransacciones.toMap());

  // Add any Firestore field values
  totalidadDeTransacciones.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTotalidadDeTransaccionesListFirestoreData(
  List<TotalidadDeTransaccionesStruct>? totalidadDeTransaccioness,
) =>
    totalidadDeTransaccioness
        ?.map((e) => getTotalidadDeTransaccionesFirestoreData(e, true))
        .toList() ??
    [];
