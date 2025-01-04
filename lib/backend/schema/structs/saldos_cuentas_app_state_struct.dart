// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SaldosCuentasAppStateStruct extends FFFirebaseStruct {
  SaldosCuentasAppStateStruct({
    String? cuenta,
    double? saldo,
    String? logo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cuenta = cuenta,
        _saldo = saldo,
        _logo = logo,
        super(firestoreUtilData);

  // "cuenta" field.
  String? _cuenta;
  String get cuenta => _cuenta ?? '';
  set cuenta(String? val) => _cuenta = val;

  bool hasCuenta() => _cuenta != null;

  // "saldo" field.
  double? _saldo;
  double get saldo => _saldo ?? 0.0;
  set saldo(double? val) => _saldo = val;

  void incrementSaldo(double amount) => saldo = saldo + amount;

  bool hasSaldo() => _saldo != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  static SaldosCuentasAppStateStruct fromMap(Map<String, dynamic> data) =>
      SaldosCuentasAppStateStruct(
        cuenta: data['cuenta'] as String?,
        saldo: castToType<double>(data['saldo']),
        logo: data['logo'] as String?,
      );

  static SaldosCuentasAppStateStruct? maybeFromMap(dynamic data) => data is Map
      ? SaldosCuentasAppStateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cuenta': _cuenta,
        'saldo': _saldo,
        'logo': _logo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cuenta': serializeParam(
          _cuenta,
          ParamType.String,
        ),
        'saldo': serializeParam(
          _saldo,
          ParamType.double,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
      }.withoutNulls;

  static SaldosCuentasAppStateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SaldosCuentasAppStateStruct(
        cuenta: deserializeParam(
          data['cuenta'],
          ParamType.String,
          false,
        ),
        saldo: deserializeParam(
          data['saldo'],
          ParamType.double,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SaldosCuentasAppStateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SaldosCuentasAppStateStruct &&
        cuenta == other.cuenta &&
        saldo == other.saldo &&
        logo == other.logo;
  }

  @override
  int get hashCode => const ListEquality().hash([cuenta, saldo, logo]);
}

SaldosCuentasAppStateStruct createSaldosCuentasAppStateStruct({
  String? cuenta,
  double? saldo,
  String? logo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SaldosCuentasAppStateStruct(
      cuenta: cuenta,
      saldo: saldo,
      logo: logo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SaldosCuentasAppStateStruct? updateSaldosCuentasAppStateStruct(
  SaldosCuentasAppStateStruct? saldosCuentasAppState, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    saldosCuentasAppState
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSaldosCuentasAppStateStructData(
  Map<String, dynamic> firestoreData,
  SaldosCuentasAppStateStruct? saldosCuentasAppState,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (saldosCuentasAppState == null) {
    return;
  }
  if (saldosCuentasAppState.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      saldosCuentasAppState.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final saldosCuentasAppStateData = getSaldosCuentasAppStateFirestoreData(
      saldosCuentasAppState, forFieldValue);
  final nestedData =
      saldosCuentasAppStateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      saldosCuentasAppState.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSaldosCuentasAppStateFirestoreData(
  SaldosCuentasAppStateStruct? saldosCuentasAppState, [
  bool forFieldValue = false,
]) {
  if (saldosCuentasAppState == null) {
    return {};
  }
  final firestoreData = mapToFirestore(saldosCuentasAppState.toMap());

  // Add any Firestore field values
  saldosCuentasAppState.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSaldosCuentasAppStateListFirestoreData(
  List<SaldosCuentasAppStateStruct>? saldosCuentasAppStates,
) =>
    saldosCuentasAppStates
        ?.map((e) => getSaldosCuentasAppStateFirestoreData(e, true))
        .toList() ??
    [];
