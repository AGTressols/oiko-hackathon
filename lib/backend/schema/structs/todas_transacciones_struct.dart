// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TodasTransaccionesStruct extends FFFirebaseStruct {
  TodasTransaccionesStruct({
    DateTime? fecha,
    String? movimiento,
    double? monto,
    String? cuenta,
    String? categoria,
    String? etiqueta,
    String? observacion,
    String? cuentaCredito,
    String? logo,
    double? montoAhorro,
    String? logoCuenta,
    String? logoCuentaCredito,
    double? montoDivisa,
    DocumentReference? refTransaccion,
    DocumentReference? refCuenta,
    DocumentReference? refCategoria,
    DocumentReference? refCuentaCredito,
    DocumentReference? refEtiqueta,
    bool? divisaBool,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fecha = fecha,
        _movimiento = movimiento,
        _monto = monto,
        _cuenta = cuenta,
        _categoria = categoria,
        _etiqueta = etiqueta,
        _observacion = observacion,
        _cuentaCredito = cuentaCredito,
        _logo = logo,
        _montoAhorro = montoAhorro,
        _logoCuenta = logoCuenta,
        _logoCuentaCredito = logoCuentaCredito,
        _montoDivisa = montoDivisa,
        _refTransaccion = refTransaccion,
        _refCuenta = refCuenta,
        _refCategoria = refCategoria,
        _refCuentaCredito = refCuentaCredito,
        _refEtiqueta = refEtiqueta,
        _divisaBool = divisaBool,
        super(firestoreUtilData);

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  set fecha(DateTime? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

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

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "montoAhorro" field.
  double? _montoAhorro;
  double get montoAhorro => _montoAhorro ?? 0.0;
  set montoAhorro(double? val) => _montoAhorro = val;

  void incrementMontoAhorro(double amount) =>
      montoAhorro = montoAhorro + amount;

  bool hasMontoAhorro() => _montoAhorro != null;

  // "logoCuenta" field.
  String? _logoCuenta;
  String get logoCuenta => _logoCuenta ?? '';
  set logoCuenta(String? val) => _logoCuenta = val;

  bool hasLogoCuenta() => _logoCuenta != null;

  // "logoCuentaCredito" field.
  String? _logoCuentaCredito;
  String get logoCuentaCredito => _logoCuentaCredito ?? '';
  set logoCuentaCredito(String? val) => _logoCuentaCredito = val;

  bool hasLogoCuentaCredito() => _logoCuentaCredito != null;

  // "montoDivisa" field.
  double? _montoDivisa;
  double get montoDivisa => _montoDivisa ?? 0.0;
  set montoDivisa(double? val) => _montoDivisa = val;

  void incrementMontoDivisa(double amount) =>
      montoDivisa = montoDivisa + amount;

  bool hasMontoDivisa() => _montoDivisa != null;

  // "refTransaccion" field.
  DocumentReference? _refTransaccion;
  DocumentReference? get refTransaccion => _refTransaccion;
  set refTransaccion(DocumentReference? val) => _refTransaccion = val;

  bool hasRefTransaccion() => _refTransaccion != null;

  // "refCuenta" field.
  DocumentReference? _refCuenta;
  DocumentReference? get refCuenta => _refCuenta;
  set refCuenta(DocumentReference? val) => _refCuenta = val;

  bool hasRefCuenta() => _refCuenta != null;

  // "refCategoria" field.
  DocumentReference? _refCategoria;
  DocumentReference? get refCategoria => _refCategoria;
  set refCategoria(DocumentReference? val) => _refCategoria = val;

  bool hasRefCategoria() => _refCategoria != null;

  // "refCuentaCredito" field.
  DocumentReference? _refCuentaCredito;
  DocumentReference? get refCuentaCredito => _refCuentaCredito;
  set refCuentaCredito(DocumentReference? val) => _refCuentaCredito = val;

  bool hasRefCuentaCredito() => _refCuentaCredito != null;

  // "refEtiqueta" field.
  DocumentReference? _refEtiqueta;
  DocumentReference? get refEtiqueta => _refEtiqueta;
  set refEtiqueta(DocumentReference? val) => _refEtiqueta = val;

  bool hasRefEtiqueta() => _refEtiqueta != null;

  // "divisaBool" field.
  bool? _divisaBool;
  bool get divisaBool => _divisaBool ?? false;
  set divisaBool(bool? val) => _divisaBool = val;

  bool hasDivisaBool() => _divisaBool != null;

  static TodasTransaccionesStruct fromMap(Map<String, dynamic> data) =>
      TodasTransaccionesStruct(
        fecha: data['fecha'] as DateTime?,
        movimiento: data['movimiento'] as String?,
        monto: castToType<double>(data['monto']),
        cuenta: data['cuenta'] as String?,
        categoria: data['categoria'] as String?,
        etiqueta: data['etiqueta'] as String?,
        observacion: data['observacion'] as String?,
        cuentaCredito: data['cuentaCredito'] as String?,
        logo: data['logo'] as String?,
        montoAhorro: castToType<double>(data['montoAhorro']),
        logoCuenta: data['logoCuenta'] as String?,
        logoCuentaCredito: data['logoCuentaCredito'] as String?,
        montoDivisa: castToType<double>(data['montoDivisa']),
        refTransaccion: data['refTransaccion'] as DocumentReference?,
        refCuenta: data['refCuenta'] as DocumentReference?,
        refCategoria: data['refCategoria'] as DocumentReference?,
        refCuentaCredito: data['refCuentaCredito'] as DocumentReference?,
        refEtiqueta: data['refEtiqueta'] as DocumentReference?,
        divisaBool: data['divisaBool'] as bool?,
      );

  static TodasTransaccionesStruct? maybeFromMap(dynamic data) => data is Map
      ? TodasTransaccionesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fecha': _fecha,
        'movimiento': _movimiento,
        'monto': _monto,
        'cuenta': _cuenta,
        'categoria': _categoria,
        'etiqueta': _etiqueta,
        'observacion': _observacion,
        'cuentaCredito': _cuentaCredito,
        'logo': _logo,
        'montoAhorro': _montoAhorro,
        'logoCuenta': _logoCuenta,
        'logoCuentaCredito': _logoCuentaCredito,
        'montoDivisa': _montoDivisa,
        'refTransaccion': _refTransaccion,
        'refCuenta': _refCuenta,
        'refCategoria': _refCategoria,
        'refCuentaCredito': _refCuentaCredito,
        'refEtiqueta': _refEtiqueta,
        'divisaBool': _divisaBool,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fecha': serializeParam(
          _fecha,
          ParamType.DateTime,
        ),
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
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'montoAhorro': serializeParam(
          _montoAhorro,
          ParamType.double,
        ),
        'logoCuenta': serializeParam(
          _logoCuenta,
          ParamType.String,
        ),
        'logoCuentaCredito': serializeParam(
          _logoCuentaCredito,
          ParamType.String,
        ),
        'montoDivisa': serializeParam(
          _montoDivisa,
          ParamType.double,
        ),
        'refTransaccion': serializeParam(
          _refTransaccion,
          ParamType.DocumentReference,
        ),
        'refCuenta': serializeParam(
          _refCuenta,
          ParamType.DocumentReference,
        ),
        'refCategoria': serializeParam(
          _refCategoria,
          ParamType.DocumentReference,
        ),
        'refCuentaCredito': serializeParam(
          _refCuentaCredito,
          ParamType.DocumentReference,
        ),
        'refEtiqueta': serializeParam(
          _refEtiqueta,
          ParamType.DocumentReference,
        ),
        'divisaBool': serializeParam(
          _divisaBool,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TodasTransaccionesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TodasTransaccionesStruct(
        fecha: deserializeParam(
          data['fecha'],
          ParamType.DateTime,
          false,
        ),
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
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        montoAhorro: deserializeParam(
          data['montoAhorro'],
          ParamType.double,
          false,
        ),
        logoCuenta: deserializeParam(
          data['logoCuenta'],
          ParamType.String,
          false,
        ),
        logoCuentaCredito: deserializeParam(
          data['logoCuentaCredito'],
          ParamType.String,
          false,
        ),
        montoDivisa: deserializeParam(
          data['montoDivisa'],
          ParamType.double,
          false,
        ),
        refTransaccion: deserializeParam(
          data['refTransaccion'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Transacciones'],
        ),
        refCuenta: deserializeParam(
          data['refCuenta'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Cuentas'],
        ),
        refCategoria: deserializeParam(
          data['refCategoria'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Categorias'],
        ),
        refCuentaCredito: deserializeParam(
          data['refCuentaCredito'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Cuentas'],
        ),
        refEtiqueta: deserializeParam(
          data['refEtiqueta'],
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
  String toString() => 'TodasTransaccionesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TodasTransaccionesStruct &&
        fecha == other.fecha &&
        movimiento == other.movimiento &&
        monto == other.monto &&
        cuenta == other.cuenta &&
        categoria == other.categoria &&
        etiqueta == other.etiqueta &&
        observacion == other.observacion &&
        cuentaCredito == other.cuentaCredito &&
        logo == other.logo &&
        montoAhorro == other.montoAhorro &&
        logoCuenta == other.logoCuenta &&
        logoCuentaCredito == other.logoCuentaCredito &&
        montoDivisa == other.montoDivisa &&
        refTransaccion == other.refTransaccion &&
        refCuenta == other.refCuenta &&
        refCategoria == other.refCategoria &&
        refCuentaCredito == other.refCuentaCredito &&
        refEtiqueta == other.refEtiqueta &&
        divisaBool == other.divisaBool;
  }

  @override
  int get hashCode => const ListEquality().hash([
        fecha,
        movimiento,
        monto,
        cuenta,
        categoria,
        etiqueta,
        observacion,
        cuentaCredito,
        logo,
        montoAhorro,
        logoCuenta,
        logoCuentaCredito,
        montoDivisa,
        refTransaccion,
        refCuenta,
        refCategoria,
        refCuentaCredito,
        refEtiqueta,
        divisaBool
      ]);
}

TodasTransaccionesStruct createTodasTransaccionesStruct({
  DateTime? fecha,
  String? movimiento,
  double? monto,
  String? cuenta,
  String? categoria,
  String? etiqueta,
  String? observacion,
  String? cuentaCredito,
  String? logo,
  double? montoAhorro,
  String? logoCuenta,
  String? logoCuentaCredito,
  double? montoDivisa,
  DocumentReference? refTransaccion,
  DocumentReference? refCuenta,
  DocumentReference? refCategoria,
  DocumentReference? refCuentaCredito,
  DocumentReference? refEtiqueta,
  bool? divisaBool,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TodasTransaccionesStruct(
      fecha: fecha,
      movimiento: movimiento,
      monto: monto,
      cuenta: cuenta,
      categoria: categoria,
      etiqueta: etiqueta,
      observacion: observacion,
      cuentaCredito: cuentaCredito,
      logo: logo,
      montoAhorro: montoAhorro,
      logoCuenta: logoCuenta,
      logoCuentaCredito: logoCuentaCredito,
      montoDivisa: montoDivisa,
      refTransaccion: refTransaccion,
      refCuenta: refCuenta,
      refCategoria: refCategoria,
      refCuentaCredito: refCuentaCredito,
      refEtiqueta: refEtiqueta,
      divisaBool: divisaBool,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TodasTransaccionesStruct? updateTodasTransaccionesStruct(
  TodasTransaccionesStruct? todasTransacciones, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    todasTransacciones
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTodasTransaccionesStructData(
  Map<String, dynamic> firestoreData,
  TodasTransaccionesStruct? todasTransacciones,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (todasTransacciones == null) {
    return;
  }
  if (todasTransacciones.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && todasTransacciones.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final todasTransaccionesData =
      getTodasTransaccionesFirestoreData(todasTransacciones, forFieldValue);
  final nestedData =
      todasTransaccionesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      todasTransacciones.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTodasTransaccionesFirestoreData(
  TodasTransaccionesStruct? todasTransacciones, [
  bool forFieldValue = false,
]) {
  if (todasTransacciones == null) {
    return {};
  }
  final firestoreData = mapToFirestore(todasTransacciones.toMap());

  // Add any Firestore field values
  todasTransacciones.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTodasTransaccionesListFirestoreData(
  List<TodasTransaccionesStruct>? todasTransaccioness,
) =>
    todasTransaccioness
        ?.map((e) => getTodasTransaccionesFirestoreData(e, true))
        .toList() ??
    [];
