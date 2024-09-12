// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TortaCategoriaGastoStruct extends FFFirebaseStruct {
  TortaCategoriaGastoStruct({
    String? logo,
    String? categoria,
    double? gasto,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _logo = logo,
        _categoria = categoria,
        _gasto = gasto,
        super(firestoreUtilData);

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "gasto" field.
  double? _gasto;
  double get gasto => _gasto ?? 0.0;
  set gasto(double? val) => _gasto = val;

  void incrementGasto(double amount) => gasto = gasto + amount;

  bool hasGasto() => _gasto != null;

  static TortaCategoriaGastoStruct fromMap(Map<String, dynamic> data) =>
      TortaCategoriaGastoStruct(
        logo: data['logo'] as String?,
        categoria: data['categoria'] as String?,
        gasto: castToType<double>(data['gasto']),
      );

  static TortaCategoriaGastoStruct? maybeFromMap(dynamic data) => data is Map
      ? TortaCategoriaGastoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'logo': _logo,
        'categoria': _categoria,
        'gasto': _gasto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'gasto': serializeParam(
          _gasto,
          ParamType.double,
        ),
      }.withoutNulls;

  static TortaCategoriaGastoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TortaCategoriaGastoStruct(
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        gasto: deserializeParam(
          data['gasto'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TortaCategoriaGastoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TortaCategoriaGastoStruct &&
        logo == other.logo &&
        categoria == other.categoria &&
        gasto == other.gasto;
  }

  @override
  int get hashCode => const ListEquality().hash([logo, categoria, gasto]);
}

TortaCategoriaGastoStruct createTortaCategoriaGastoStruct({
  String? logo,
  String? categoria,
  double? gasto,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TortaCategoriaGastoStruct(
      logo: logo,
      categoria: categoria,
      gasto: gasto,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TortaCategoriaGastoStruct? updateTortaCategoriaGastoStruct(
  TortaCategoriaGastoStruct? tortaCategoriaGasto, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tortaCategoriaGasto
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTortaCategoriaGastoStructData(
  Map<String, dynamic> firestoreData,
  TortaCategoriaGastoStruct? tortaCategoriaGasto,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tortaCategoriaGasto == null) {
    return;
  }
  if (tortaCategoriaGasto.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tortaCategoriaGasto.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tortaCategoriaGastoData =
      getTortaCategoriaGastoFirestoreData(tortaCategoriaGasto, forFieldValue);
  final nestedData =
      tortaCategoriaGastoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      tortaCategoriaGasto.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTortaCategoriaGastoFirestoreData(
  TortaCategoriaGastoStruct? tortaCategoriaGasto, [
  bool forFieldValue = false,
]) {
  if (tortaCategoriaGasto == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tortaCategoriaGasto.toMap());

  // Add any Firestore field values
  tortaCategoriaGasto.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTortaCategoriaGastoListFirestoreData(
  List<TortaCategoriaGastoStruct>? tortaCategoriaGastos,
) =>
    tortaCategoriaGastos
        ?.map((e) => getTortaCategoriaGastoFirestoreData(e, true))
        .toList() ??
    [];
