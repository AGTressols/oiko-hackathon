// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DummyAhorroStruct extends FFFirebaseStruct {
  DummyAhorroStruct({
    String? cuenta,
    double? monto,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cuenta = cuenta,
        _monto = monto,
        super(firestoreUtilData);

  // "cuenta" field.
  String? _cuenta;
  String get cuenta => _cuenta ?? '';
  set cuenta(String? val) => _cuenta = val;

  bool hasCuenta() => _cuenta != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  set monto(double? val) => _monto = val;

  void incrementMonto(double amount) => monto = monto + amount;

  bool hasMonto() => _monto != null;

  static DummyAhorroStruct fromMap(Map<String, dynamic> data) =>
      DummyAhorroStruct(
        cuenta: data['cuenta'] as String?,
        monto: castToType<double>(data['monto']),
      );

  static DummyAhorroStruct? maybeFromMap(dynamic data) => data is Map
      ? DummyAhorroStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cuenta': _cuenta,
        'monto': _monto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cuenta': serializeParam(
          _cuenta,
          ParamType.String,
        ),
        'monto': serializeParam(
          _monto,
          ParamType.double,
        ),
      }.withoutNulls;

  static DummyAhorroStruct fromSerializableMap(Map<String, dynamic> data) =>
      DummyAhorroStruct(
        cuenta: deserializeParam(
          data['cuenta'],
          ParamType.String,
          false,
        ),
        monto: deserializeParam(
          data['monto'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DummyAhorroStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DummyAhorroStruct &&
        cuenta == other.cuenta &&
        monto == other.monto;
  }

  @override
  int get hashCode => const ListEquality().hash([cuenta, monto]);
}

DummyAhorroStruct createDummyAhorroStruct({
  String? cuenta,
  double? monto,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DummyAhorroStruct(
      cuenta: cuenta,
      monto: monto,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DummyAhorroStruct? updateDummyAhorroStruct(
  DummyAhorroStruct? dummyAhorro, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dummyAhorro
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDummyAhorroStructData(
  Map<String, dynamic> firestoreData,
  DummyAhorroStruct? dummyAhorro,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dummyAhorro == null) {
    return;
  }
  if (dummyAhorro.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dummyAhorro.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dummyAhorroData =
      getDummyAhorroFirestoreData(dummyAhorro, forFieldValue);
  final nestedData =
      dummyAhorroData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dummyAhorro.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDummyAhorroFirestoreData(
  DummyAhorroStruct? dummyAhorro, [
  bool forFieldValue = false,
]) {
  if (dummyAhorro == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dummyAhorro.toMap());

  // Add any Firestore field values
  dummyAhorro.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDummyAhorroListFirestoreData(
  List<DummyAhorroStruct>? dummyAhorros,
) =>
    dummyAhorros?.map((e) => getDummyAhorroFirestoreData(e, true)).toList() ??
    [];
