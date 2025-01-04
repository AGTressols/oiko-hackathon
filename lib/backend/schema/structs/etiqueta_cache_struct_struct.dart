// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EtiquetaCacheStructStruct extends FFFirebaseStruct {
  EtiquetaCacheStructStruct({
    String? id,
    String? etiqueta,
    bool? activa,
    DocumentReference? categoria,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _etiqueta = etiqueta,
        _activa = activa,
        _categoria = categoria,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "etiqueta" field.
  String? _etiqueta;
  String get etiqueta => _etiqueta ?? '';
  set etiqueta(String? val) => _etiqueta = val;

  bool hasEtiqueta() => _etiqueta != null;

  // "activa" field.
  bool? _activa;
  bool get activa => _activa ?? false;
  set activa(bool? val) => _activa = val;

  bool hasActiva() => _activa != null;

  // "categoria" field.
  DocumentReference? _categoria;
  DocumentReference? get categoria => _categoria;
  set categoria(DocumentReference? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  static EtiquetaCacheStructStruct fromMap(Map<String, dynamic> data) =>
      EtiquetaCacheStructStruct(
        id: data['id'] as String?,
        etiqueta: data['etiqueta'] as String?,
        activa: data['activa'] as bool?,
        categoria: data['categoria'] as DocumentReference?,
      );

  static EtiquetaCacheStructStruct? maybeFromMap(dynamic data) => data is Map
      ? EtiquetaCacheStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'etiqueta': _etiqueta,
        'activa': _activa,
        'categoria': _categoria,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'etiqueta': serializeParam(
          _etiqueta,
          ParamType.String,
        ),
        'activa': serializeParam(
          _activa,
          ParamType.bool,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static EtiquetaCacheStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EtiquetaCacheStructStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        etiqueta: deserializeParam(
          data['etiqueta'],
          ParamType.String,
          false,
        ),
        activa: deserializeParam(
          data['activa'],
          ParamType.bool,
          false,
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Categorias'],
        ),
      );

  @override
  String toString() => 'EtiquetaCacheStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EtiquetaCacheStructStruct &&
        id == other.id &&
        etiqueta == other.etiqueta &&
        activa == other.activa &&
        categoria == other.categoria;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, etiqueta, activa, categoria]);
}

EtiquetaCacheStructStruct createEtiquetaCacheStructStruct({
  String? id,
  String? etiqueta,
  bool? activa,
  DocumentReference? categoria,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EtiquetaCacheStructStruct(
      id: id,
      etiqueta: etiqueta,
      activa: activa,
      categoria: categoria,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EtiquetaCacheStructStruct? updateEtiquetaCacheStructStruct(
  EtiquetaCacheStructStruct? etiquetaCacheStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    etiquetaCacheStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEtiquetaCacheStructStructData(
  Map<String, dynamic> firestoreData,
  EtiquetaCacheStructStruct? etiquetaCacheStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (etiquetaCacheStruct == null) {
    return;
  }
  if (etiquetaCacheStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && etiquetaCacheStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final etiquetaCacheStructData =
      getEtiquetaCacheStructFirestoreData(etiquetaCacheStruct, forFieldValue);
  final nestedData =
      etiquetaCacheStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      etiquetaCacheStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEtiquetaCacheStructFirestoreData(
  EtiquetaCacheStructStruct? etiquetaCacheStruct, [
  bool forFieldValue = false,
]) {
  if (etiquetaCacheStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(etiquetaCacheStruct.toMap());

  // Add any Firestore field values
  etiquetaCacheStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEtiquetaCacheStructListFirestoreData(
  List<EtiquetaCacheStructStruct>? etiquetaCacheStructs,
) =>
    etiquetaCacheStructs
        ?.map((e) => getEtiquetaCacheStructFirestoreData(e, true))
        .toList() ??
    [];
