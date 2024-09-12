// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GastosCuentasStruct extends FFFirebaseStruct {
  GastosCuentasStruct({
    String? cuenta,
    double? monto,
    double? restoMonto,
    String? logo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cuenta = cuenta,
        _monto = monto,
        _restoMonto = restoMonto,
        _logo = logo,
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

  // "restoMonto" field.
  double? _restoMonto;
  double get restoMonto => _restoMonto ?? 0.0;
  set restoMonto(double? val) => _restoMonto = val;

  void incrementRestoMonto(double amount) => restoMonto = restoMonto + amount;

  bool hasRestoMonto() => _restoMonto != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  static GastosCuentasStruct fromMap(Map<String, dynamic> data) =>
      GastosCuentasStruct(
        cuenta: data['cuenta'] as String?,
        monto: castToType<double>(data['monto']),
        restoMonto: castToType<double>(data['restoMonto']),
        logo: data['logo'] as String?,
      );

  static GastosCuentasStruct? maybeFromMap(dynamic data) => data is Map
      ? GastosCuentasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cuenta': _cuenta,
        'monto': _monto,
        'restoMonto': _restoMonto,
        'logo': _logo,
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
        'restoMonto': serializeParam(
          _restoMonto,
          ParamType.double,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
      }.withoutNulls;

  static GastosCuentasStruct fromSerializableMap(Map<String, dynamic> data) =>
      GastosCuentasStruct(
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
        restoMonto: deserializeParam(
          data['restoMonto'],
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
  String toString() => 'GastosCuentasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GastosCuentasStruct &&
        cuenta == other.cuenta &&
        monto == other.monto &&
        restoMonto == other.restoMonto &&
        logo == other.logo;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([cuenta, monto, restoMonto, logo]);
}

GastosCuentasStruct createGastosCuentasStruct({
  String? cuenta,
  double? monto,
  double? restoMonto,
  String? logo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GastosCuentasStruct(
      cuenta: cuenta,
      monto: monto,
      restoMonto: restoMonto,
      logo: logo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GastosCuentasStruct? updateGastosCuentasStruct(
  GastosCuentasStruct? gastosCuentas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gastosCuentas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGastosCuentasStructData(
  Map<String, dynamic> firestoreData,
  GastosCuentasStruct? gastosCuentas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gastosCuentas == null) {
    return;
  }
  if (gastosCuentas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gastosCuentas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gastosCuentasData =
      getGastosCuentasFirestoreData(gastosCuentas, forFieldValue);
  final nestedData =
      gastosCuentasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gastosCuentas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGastosCuentasFirestoreData(
  GastosCuentasStruct? gastosCuentas, [
  bool forFieldValue = false,
]) {
  if (gastosCuentas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gastosCuentas.toMap());

  // Add any Firestore field values
  gastosCuentas.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGastosCuentasListFirestoreData(
  List<GastosCuentasStruct>? gastosCuentass,
) =>
    gastosCuentass
        ?.map((e) => getGastosCuentasFirestoreData(e, true))
        .toList() ??
    [];
