// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TraspasoDataTypeStruct extends FFFirebaseStruct {
  TraspasoDataTypeStruct({
    double? monto,
    DateTime? fecha,
    String? cuenta,
    String? cuentaDestino,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _monto = monto,
        _fecha = fecha,
        _cuenta = cuenta,
        _cuentaDestino = cuentaDestino,
        super(firestoreUtilData);

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  set monto(double? val) => _monto = val;

  void incrementMonto(double amount) => monto = monto + amount;

  bool hasMonto() => _monto != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  set fecha(DateTime? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

  // "cuenta" field.
  String? _cuenta;
  String get cuenta => _cuenta ?? '';
  set cuenta(String? val) => _cuenta = val;

  bool hasCuenta() => _cuenta != null;

  // "cuentaDestino" field.
  String? _cuentaDestino;
  String get cuentaDestino => _cuentaDestino ?? '';
  set cuentaDestino(String? val) => _cuentaDestino = val;

  bool hasCuentaDestino() => _cuentaDestino != null;

  static TraspasoDataTypeStruct fromMap(Map<String, dynamic> data) =>
      TraspasoDataTypeStruct(
        monto: castToType<double>(data['monto']),
        fecha: data['fecha'] as DateTime?,
        cuenta: data['cuenta'] as String?,
        cuentaDestino: data['cuentaDestino'] as String?,
      );

  static TraspasoDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? TraspasoDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'monto': _monto,
        'fecha': _fecha,
        'cuenta': _cuenta,
        'cuentaDestino': _cuentaDestino,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'monto': serializeParam(
          _monto,
          ParamType.double,
        ),
        'fecha': serializeParam(
          _fecha,
          ParamType.DateTime,
        ),
        'cuenta': serializeParam(
          _cuenta,
          ParamType.String,
        ),
        'cuentaDestino': serializeParam(
          _cuentaDestino,
          ParamType.String,
        ),
      }.withoutNulls;

  static TraspasoDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TraspasoDataTypeStruct(
        monto: deserializeParam(
          data['monto'],
          ParamType.double,
          false,
        ),
        fecha: deserializeParam(
          data['fecha'],
          ParamType.DateTime,
          false,
        ),
        cuenta: deserializeParam(
          data['cuenta'],
          ParamType.String,
          false,
        ),
        cuentaDestino: deserializeParam(
          data['cuentaDestino'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TraspasoDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TraspasoDataTypeStruct &&
        monto == other.monto &&
        fecha == other.fecha &&
        cuenta == other.cuenta &&
        cuentaDestino == other.cuentaDestino;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([monto, fecha, cuenta, cuentaDestino]);
}

TraspasoDataTypeStruct createTraspasoDataTypeStruct({
  double? monto,
  DateTime? fecha,
  String? cuenta,
  String? cuentaDestino,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TraspasoDataTypeStruct(
      monto: monto,
      fecha: fecha,
      cuenta: cuenta,
      cuentaDestino: cuentaDestino,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TraspasoDataTypeStruct? updateTraspasoDataTypeStruct(
  TraspasoDataTypeStruct? traspasoDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    traspasoDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTraspasoDataTypeStructData(
  Map<String, dynamic> firestoreData,
  TraspasoDataTypeStruct? traspasoDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (traspasoDataType == null) {
    return;
  }
  if (traspasoDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && traspasoDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final traspasoDataTypeData =
      getTraspasoDataTypeFirestoreData(traspasoDataType, forFieldValue);
  final nestedData =
      traspasoDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = traspasoDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTraspasoDataTypeFirestoreData(
  TraspasoDataTypeStruct? traspasoDataType, [
  bool forFieldValue = false,
]) {
  if (traspasoDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(traspasoDataType.toMap());

  // Add any Firestore field values
  traspasoDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTraspasoDataTypeListFirestoreData(
  List<TraspasoDataTypeStruct>? traspasoDataTypes,
) =>
    traspasoDataTypes
        ?.map((e) => getTraspasoDataTypeFirestoreData(e, true))
        .toList() ??
    [];
