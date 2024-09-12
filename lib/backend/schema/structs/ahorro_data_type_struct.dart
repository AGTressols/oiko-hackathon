// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AhorroDataTypeStruct extends FFFirebaseStruct {
  AhorroDataTypeStruct({
    double? monto,
    DateTime? fecha,
    String? cuenta,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _monto = monto,
        _fecha = fecha,
        _cuenta = cuenta,
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

  static AhorroDataTypeStruct fromMap(Map<String, dynamic> data) =>
      AhorroDataTypeStruct(
        monto: castToType<double>(data['monto']),
        fecha: data['fecha'] as DateTime?,
        cuenta: data['cuenta'] as String?,
      );

  static AhorroDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? AhorroDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'monto': _monto,
        'fecha': _fecha,
        'cuenta': _cuenta,
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
      }.withoutNulls;

  static AhorroDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      AhorroDataTypeStruct(
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
      );

  @override
  String toString() => 'AhorroDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AhorroDataTypeStruct &&
        monto == other.monto &&
        fecha == other.fecha &&
        cuenta == other.cuenta;
  }

  @override
  int get hashCode => const ListEquality().hash([monto, fecha, cuenta]);
}

AhorroDataTypeStruct createAhorroDataTypeStruct({
  double? monto,
  DateTime? fecha,
  String? cuenta,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AhorroDataTypeStruct(
      monto: monto,
      fecha: fecha,
      cuenta: cuenta,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AhorroDataTypeStruct? updateAhorroDataTypeStruct(
  AhorroDataTypeStruct? ahorroDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ahorroDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAhorroDataTypeStructData(
  Map<String, dynamic> firestoreData,
  AhorroDataTypeStruct? ahorroDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ahorroDataType == null) {
    return;
  }
  if (ahorroDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ahorroDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ahorroDataTypeData =
      getAhorroDataTypeFirestoreData(ahorroDataType, forFieldValue);
  final nestedData =
      ahorroDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ahorroDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAhorroDataTypeFirestoreData(
  AhorroDataTypeStruct? ahorroDataType, [
  bool forFieldValue = false,
]) {
  if (ahorroDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ahorroDataType.toMap());

  // Add any Firestore field values
  ahorroDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAhorroDataTypeListFirestoreData(
  List<AhorroDataTypeStruct>? ahorroDataTypes,
) =>
    ahorroDataTypes
        ?.map((e) => getAhorroDataTypeFirestoreData(e, true))
        .toList() ??
    [];
