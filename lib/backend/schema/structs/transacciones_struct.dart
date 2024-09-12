// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransaccionesStruct extends FFFirebaseStruct {
  TransaccionesStruct({
    List<DateTime>? fecha,
    List<String>? movimiento,
    List<double>? monto,
    List<String>? cuenta,
    List<String>? categoria,
    List<String>? etiqueta,
    List<String>? cuentaCredito,
    List<String>? uid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fecha = fecha,
        _movimiento = movimiento,
        _monto = monto,
        _cuenta = cuenta,
        _categoria = categoria,
        _etiqueta = etiqueta,
        _cuentaCredito = cuentaCredito,
        _uid = uid,
        super(firestoreUtilData);

  // "fecha" field.
  List<DateTime>? _fecha;
  List<DateTime> get fecha => _fecha ?? const [];
  set fecha(List<DateTime>? val) => _fecha = val;

  void updateFecha(Function(List<DateTime>) updateFn) {
    updateFn(_fecha ??= []);
  }

  bool hasFecha() => _fecha != null;

  // "movimiento" field.
  List<String>? _movimiento;
  List<String> get movimiento => _movimiento ?? const [];
  set movimiento(List<String>? val) => _movimiento = val;

  void updateMovimiento(Function(List<String>) updateFn) {
    updateFn(_movimiento ??= []);
  }

  bool hasMovimiento() => _movimiento != null;

  // "monto" field.
  List<double>? _monto;
  List<double> get monto => _monto ?? const [];
  set monto(List<double>? val) => _monto = val;

  void updateMonto(Function(List<double>) updateFn) {
    updateFn(_monto ??= []);
  }

  bool hasMonto() => _monto != null;

  // "cuenta" field.
  List<String>? _cuenta;
  List<String> get cuenta => _cuenta ?? const [];
  set cuenta(List<String>? val) => _cuenta = val;

  void updateCuenta(Function(List<String>) updateFn) {
    updateFn(_cuenta ??= []);
  }

  bool hasCuenta() => _cuenta != null;

  // "categoria" field.
  List<String>? _categoria;
  List<String> get categoria => _categoria ?? const [];
  set categoria(List<String>? val) => _categoria = val;

  void updateCategoria(Function(List<String>) updateFn) {
    updateFn(_categoria ??= []);
  }

  bool hasCategoria() => _categoria != null;

  // "etiqueta" field.
  List<String>? _etiqueta;
  List<String> get etiqueta => _etiqueta ?? const [];
  set etiqueta(List<String>? val) => _etiqueta = val;

  void updateEtiqueta(Function(List<String>) updateFn) {
    updateFn(_etiqueta ??= []);
  }

  bool hasEtiqueta() => _etiqueta != null;

  // "cuentaCredito" field.
  List<String>? _cuentaCredito;
  List<String> get cuentaCredito => _cuentaCredito ?? const [];
  set cuentaCredito(List<String>? val) => _cuentaCredito = val;

  void updateCuentaCredito(Function(List<String>) updateFn) {
    updateFn(_cuentaCredito ??= []);
  }

  bool hasCuentaCredito() => _cuentaCredito != null;

  // "uid" field.
  List<String>? _uid;
  List<String> get uid => _uid ?? const [];
  set uid(List<String>? val) => _uid = val;

  void updateUid(Function(List<String>) updateFn) {
    updateFn(_uid ??= []);
  }

  bool hasUid() => _uid != null;

  static TransaccionesStruct fromMap(Map<String, dynamic> data) =>
      TransaccionesStruct(
        fecha: getDataList(data['fecha']),
        movimiento: getDataList(data['movimiento']),
        monto: getDataList(data['monto']),
        cuenta: getDataList(data['cuenta']),
        categoria: getDataList(data['categoria']),
        etiqueta: getDataList(data['etiqueta']),
        cuentaCredito: getDataList(data['cuentaCredito']),
        uid: getDataList(data['uid']),
      );

  static TransaccionesStruct? maybeFromMap(dynamic data) => data is Map
      ? TransaccionesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fecha': _fecha,
        'movimiento': _movimiento,
        'monto': _monto,
        'cuenta': _cuenta,
        'categoria': _categoria,
        'etiqueta': _etiqueta,
        'cuentaCredito': _cuentaCredito,
        'uid': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fecha': serializeParam(
          _fecha,
          ParamType.DateTime,
          isList: true,
        ),
        'movimiento': serializeParam(
          _movimiento,
          ParamType.String,
          isList: true,
        ),
        'monto': serializeParam(
          _monto,
          ParamType.double,
          isList: true,
        ),
        'cuenta': serializeParam(
          _cuenta,
          ParamType.String,
          isList: true,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
          isList: true,
        ),
        'etiqueta': serializeParam(
          _etiqueta,
          ParamType.String,
          isList: true,
        ),
        'cuentaCredito': serializeParam(
          _cuentaCredito,
          ParamType.String,
          isList: true,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static TransaccionesStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransaccionesStruct(
        fecha: deserializeParam<DateTime>(
          data['fecha'],
          ParamType.DateTime,
          true,
        ),
        movimiento: deserializeParam<String>(
          data['movimiento'],
          ParamType.String,
          true,
        ),
        monto: deserializeParam<double>(
          data['monto'],
          ParamType.double,
          true,
        ),
        cuenta: deserializeParam<String>(
          data['cuenta'],
          ParamType.String,
          true,
        ),
        categoria: deserializeParam<String>(
          data['categoria'],
          ParamType.String,
          true,
        ),
        etiqueta: deserializeParam<String>(
          data['etiqueta'],
          ParamType.String,
          true,
        ),
        cuentaCredito: deserializeParam<String>(
          data['cuentaCredito'],
          ParamType.String,
          true,
        ),
        uid: deserializeParam<String>(
          data['uid'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'TransaccionesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TransaccionesStruct &&
        listEquality.equals(fecha, other.fecha) &&
        listEquality.equals(movimiento, other.movimiento) &&
        listEquality.equals(monto, other.monto) &&
        listEquality.equals(cuenta, other.cuenta) &&
        listEquality.equals(categoria, other.categoria) &&
        listEquality.equals(etiqueta, other.etiqueta) &&
        listEquality.equals(cuentaCredito, other.cuentaCredito) &&
        listEquality.equals(uid, other.uid);
  }

  @override
  int get hashCode => const ListEquality().hash([
        fecha,
        movimiento,
        monto,
        cuenta,
        categoria,
        etiqueta,
        cuentaCredito,
        uid
      ]);
}

TransaccionesStruct createTransaccionesStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TransaccionesStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TransaccionesStruct? updateTransaccionesStruct(
  TransaccionesStruct? transacciones, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    transacciones
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTransaccionesStructData(
  Map<String, dynamic> firestoreData,
  TransaccionesStruct? transacciones,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (transacciones == null) {
    return;
  }
  if (transacciones.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && transacciones.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final transaccionesData =
      getTransaccionesFirestoreData(transacciones, forFieldValue);
  final nestedData =
      transaccionesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = transacciones.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTransaccionesFirestoreData(
  TransaccionesStruct? transacciones, [
  bool forFieldValue = false,
]) {
  if (transacciones == null) {
    return {};
  }
  final firestoreData = mapToFirestore(transacciones.toMap());

  // Add any Firestore field values
  transacciones.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTransaccionesListFirestoreData(
  List<TransaccionesStruct>? transaccioness,
) =>
    transaccioness
        ?.map((e) => getTransaccionesFirestoreData(e, true))
        .toList() ??
    [];
