// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CategoriasCacheStructStruct extends FFFirebaseStruct {
  CategoriasCacheStructStruct({
    String? movimiento,
    String? categoria,
    String? logo,
    double? presupuesto,
    bool? activa,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _movimiento = movimiento,
        _categoria = categoria,
        _logo = logo,
        _presupuesto = presupuesto,
        _activa = activa,
        _id = id,
        super(firestoreUtilData);

  // "movimiento" field.
  String? _movimiento;
  String get movimiento => _movimiento ?? '';
  set movimiento(String? val) => _movimiento = val;

  bool hasMovimiento() => _movimiento != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "presupuesto" field.
  double? _presupuesto;
  double get presupuesto => _presupuesto ?? 0.0;
  set presupuesto(double? val) => _presupuesto = val;

  void incrementPresupuesto(double amount) =>
      presupuesto = presupuesto + amount;

  bool hasPresupuesto() => _presupuesto != null;

  // "activa" field.
  bool? _activa;
  bool get activa => _activa ?? false;
  set activa(bool? val) => _activa = val;

  bool hasActiva() => _activa != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static CategoriasCacheStructStruct fromMap(Map<String, dynamic> data) =>
      CategoriasCacheStructStruct(
        movimiento: data['movimiento'] as String?,
        categoria: data['categoria'] as String?,
        logo: data['logo'] as String?,
        presupuesto: castToType<double>(data['presupuesto']),
        activa: data['activa'] as bool?,
        id: data['id'] as String?,
      );

  static CategoriasCacheStructStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriasCacheStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'movimiento': _movimiento,
        'categoria': _categoria,
        'logo': _logo,
        'presupuesto': _presupuesto,
        'activa': _activa,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'movimiento': serializeParam(
          _movimiento,
          ParamType.String,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'presupuesto': serializeParam(
          _presupuesto,
          ParamType.double,
        ),
        'activa': serializeParam(
          _activa,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoriasCacheStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CategoriasCacheStructStruct(
        movimiento: deserializeParam(
          data['movimiento'],
          ParamType.String,
          false,
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        presupuesto: deserializeParam(
          data['presupuesto'],
          ParamType.double,
          false,
        ),
        activa: deserializeParam(
          data['activa'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CategoriasCacheStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriasCacheStructStruct &&
        movimiento == other.movimiento &&
        categoria == other.categoria &&
        logo == other.logo &&
        presupuesto == other.presupuesto &&
        activa == other.activa &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([movimiento, categoria, logo, presupuesto, activa, id]);
}

CategoriasCacheStructStruct createCategoriasCacheStructStruct({
  String? movimiento,
  String? categoria,
  String? logo,
  double? presupuesto,
  bool? activa,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoriasCacheStructStruct(
      movimiento: movimiento,
      categoria: categoria,
      logo: logo,
      presupuesto: presupuesto,
      activa: activa,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoriasCacheStructStruct? updateCategoriasCacheStructStruct(
  CategoriasCacheStructStruct? categoriasCacheStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categoriasCacheStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoriasCacheStructStructData(
  Map<String, dynamic> firestoreData,
  CategoriasCacheStructStruct? categoriasCacheStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categoriasCacheStruct == null) {
    return;
  }
  if (categoriasCacheStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      categoriasCacheStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoriasCacheStructData = getCategoriasCacheStructFirestoreData(
      categoriasCacheStruct, forFieldValue);
  final nestedData =
      categoriasCacheStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      categoriasCacheStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoriasCacheStructFirestoreData(
  CategoriasCacheStructStruct? categoriasCacheStruct, [
  bool forFieldValue = false,
]) {
  if (categoriasCacheStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categoriasCacheStruct.toMap());

  // Add any Firestore field values
  categoriasCacheStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoriasCacheStructListFirestoreData(
  List<CategoriasCacheStructStruct>? categoriasCacheStructs,
) =>
    categoriasCacheStructs
        ?.map((e) => getCategoriasCacheStructFirestoreData(e, true))
        .toList() ??
    [];
