// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FlowEtiquetaStruct extends FFFirebaseStruct {
  FlowEtiquetaStruct({
    String? nombre,
    DocumentReference? etiquetaRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombre = nombre,
        _etiquetaRef = etiquetaRef,
        super(firestoreUtilData);

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "etiquetaRef" field.
  DocumentReference? _etiquetaRef;
  DocumentReference? get etiquetaRef => _etiquetaRef;
  set etiquetaRef(DocumentReference? val) => _etiquetaRef = val;

  bool hasEtiquetaRef() => _etiquetaRef != null;

  static FlowEtiquetaStruct fromMap(Map<String, dynamic> data) =>
      FlowEtiquetaStruct(
        nombre: data['nombre'] as String?,
        etiquetaRef: data['etiquetaRef'] as DocumentReference?,
      );

  static FlowEtiquetaStruct? maybeFromMap(dynamic data) => data is Map
      ? FlowEtiquetaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
        'etiquetaRef': _etiquetaRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'etiquetaRef': serializeParam(
          _etiquetaRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static FlowEtiquetaStruct fromSerializableMap(Map<String, dynamic> data) =>
      FlowEtiquetaStruct(
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        etiquetaRef: deserializeParam(
          data['etiquetaRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Etiquetas'],
        ),
      );

  @override
  String toString() => 'FlowEtiquetaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlowEtiquetaStruct &&
        nombre == other.nombre &&
        etiquetaRef == other.etiquetaRef;
  }

  @override
  int get hashCode => const ListEquality().hash([nombre, etiquetaRef]);
}

FlowEtiquetaStruct createFlowEtiquetaStruct({
  String? nombre,
  DocumentReference? etiquetaRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FlowEtiquetaStruct(
      nombre: nombre,
      etiquetaRef: etiquetaRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FlowEtiquetaStruct? updateFlowEtiquetaStruct(
  FlowEtiquetaStruct? flowEtiqueta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    flowEtiqueta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFlowEtiquetaStructData(
  Map<String, dynamic> firestoreData,
  FlowEtiquetaStruct? flowEtiqueta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (flowEtiqueta == null) {
    return;
  }
  if (flowEtiqueta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && flowEtiqueta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final flowEtiquetaData =
      getFlowEtiquetaFirestoreData(flowEtiqueta, forFieldValue);
  final nestedData =
      flowEtiquetaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = flowEtiqueta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFlowEtiquetaFirestoreData(
  FlowEtiquetaStruct? flowEtiqueta, [
  bool forFieldValue = false,
]) {
  if (flowEtiqueta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(flowEtiqueta.toMap());

  // Add any Firestore field values
  flowEtiqueta.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFlowEtiquetaListFirestoreData(
  List<FlowEtiquetaStruct>? flowEtiquetas,
) =>
    flowEtiquetas?.map((e) => getFlowEtiquetaFirestoreData(e, true)).toList() ??
    [];
