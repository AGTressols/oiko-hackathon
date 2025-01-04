// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AhorroPorCuentaStruct extends FFFirebaseStruct {
  AhorroPorCuentaStruct({
    double? totalDivisa,
    String? divisa,
    String? nombre,
    String? logo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalDivisa = totalDivisa,
        _divisa = divisa,
        _nombre = nombre,
        _logo = logo,
        super(firestoreUtilData);

  // "totalDivisa" field.
  double? _totalDivisa;
  double get totalDivisa => _totalDivisa ?? 0.0;
  set totalDivisa(double? val) => _totalDivisa = val;

  void incrementTotalDivisa(double amount) =>
      totalDivisa = totalDivisa + amount;

  bool hasTotalDivisa() => _totalDivisa != null;

  // "divisa" field.
  String? _divisa;
  String get divisa => _divisa ?? '';
  set divisa(String? val) => _divisa = val;

  bool hasDivisa() => _divisa != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  static AhorroPorCuentaStruct fromMap(Map<String, dynamic> data) =>
      AhorroPorCuentaStruct(
        totalDivisa: castToType<double>(data['totalDivisa']),
        divisa: data['divisa'] as String?,
        nombre: data['nombre'] as String?,
        logo: data['logo'] as String?,
      );

  static AhorroPorCuentaStruct? maybeFromMap(dynamic data) => data is Map
      ? AhorroPorCuentaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalDivisa': _totalDivisa,
        'divisa': _divisa,
        'nombre': _nombre,
        'logo': _logo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalDivisa': serializeParam(
          _totalDivisa,
          ParamType.double,
        ),
        'divisa': serializeParam(
          _divisa,
          ParamType.String,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
      }.withoutNulls;

  static AhorroPorCuentaStruct fromSerializableMap(Map<String, dynamic> data) =>
      AhorroPorCuentaStruct(
        totalDivisa: deserializeParam(
          data['totalDivisa'],
          ParamType.double,
          false,
        ),
        divisa: deserializeParam(
          data['divisa'],
          ParamType.String,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AhorroPorCuentaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AhorroPorCuentaStruct &&
        totalDivisa == other.totalDivisa &&
        divisa == other.divisa &&
        nombre == other.nombre &&
        logo == other.logo;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([totalDivisa, divisa, nombre, logo]);
}

AhorroPorCuentaStruct createAhorroPorCuentaStruct({
  double? totalDivisa,
  String? divisa,
  String? nombre,
  String? logo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AhorroPorCuentaStruct(
      totalDivisa: totalDivisa,
      divisa: divisa,
      nombre: nombre,
      logo: logo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AhorroPorCuentaStruct? updateAhorroPorCuentaStruct(
  AhorroPorCuentaStruct? ahorroPorCuenta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ahorroPorCuenta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAhorroPorCuentaStructData(
  Map<String, dynamic> firestoreData,
  AhorroPorCuentaStruct? ahorroPorCuenta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ahorroPorCuenta == null) {
    return;
  }
  if (ahorroPorCuenta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ahorroPorCuenta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ahorroPorCuentaData =
      getAhorroPorCuentaFirestoreData(ahorroPorCuenta, forFieldValue);
  final nestedData =
      ahorroPorCuentaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ahorroPorCuenta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAhorroPorCuentaFirestoreData(
  AhorroPorCuentaStruct? ahorroPorCuenta, [
  bool forFieldValue = false,
]) {
  if (ahorroPorCuenta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ahorroPorCuenta.toMap());

  // Add any Firestore field values
  ahorroPorCuenta.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAhorroPorCuentaListFirestoreData(
  List<AhorroPorCuentaStruct>? ahorroPorCuentas,
) =>
    ahorroPorCuentas
        ?.map((e) => getAhorroPorCuentaFirestoreData(e, true))
        .toList() ??
    [];
