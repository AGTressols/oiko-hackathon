// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FlowCategoriaStruct extends FFFirebaseStruct {
  FlowCategoriaStruct({
    String? nombre,
    DocumentReference? categoriaRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombre = nombre,
        _categoriaRef = categoriaRef,
        super(firestoreUtilData);

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "categoriaRef" field.
  DocumentReference? _categoriaRef;
  DocumentReference? get categoriaRef => _categoriaRef;
  set categoriaRef(DocumentReference? val) => _categoriaRef = val;

  bool hasCategoriaRef() => _categoriaRef != null;

  static FlowCategoriaStruct fromMap(Map<String, dynamic> data) =>
      FlowCategoriaStruct(
        nombre: data['nombre'] as String?,
        categoriaRef: data['categoriaRef'] as DocumentReference?,
      );

  static FlowCategoriaStruct? maybeFromMap(dynamic data) => data is Map
      ? FlowCategoriaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
        'categoriaRef': _categoriaRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'categoriaRef': serializeParam(
          _categoriaRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static FlowCategoriaStruct fromSerializableMap(Map<String, dynamic> data) =>
      FlowCategoriaStruct(
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        categoriaRef: deserializeParam(
          data['categoriaRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Categorias'],
        ),
      );

  @override
  String toString() => 'FlowCategoriaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlowCategoriaStruct &&
        nombre == other.nombre &&
        categoriaRef == other.categoriaRef;
  }

  @override
  int get hashCode => const ListEquality().hash([nombre, categoriaRef]);
}

FlowCategoriaStruct createFlowCategoriaStruct({
  String? nombre,
  DocumentReference? categoriaRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FlowCategoriaStruct(
      nombre: nombre,
      categoriaRef: categoriaRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FlowCategoriaStruct? updateFlowCategoriaStruct(
  FlowCategoriaStruct? flowCategoria, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    flowCategoria
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFlowCategoriaStructData(
  Map<String, dynamic> firestoreData,
  FlowCategoriaStruct? flowCategoria,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (flowCategoria == null) {
    return;
  }
  if (flowCategoria.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && flowCategoria.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final flowCategoriaData =
      getFlowCategoriaFirestoreData(flowCategoria, forFieldValue);
  final nestedData =
      flowCategoriaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = flowCategoria.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFlowCategoriaFirestoreData(
  FlowCategoriaStruct? flowCategoria, [
  bool forFieldValue = false,
]) {
  if (flowCategoria == null) {
    return {};
  }
  final firestoreData = mapToFirestore(flowCategoria.toMap());

  // Add any Firestore field values
  flowCategoria.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFlowCategoriaListFirestoreData(
  List<FlowCategoriaStruct>? flowCategorias,
) =>
    flowCategorias
        ?.map((e) => getFlowCategoriaFirestoreData(e, true))
        .toList() ??
    [];
