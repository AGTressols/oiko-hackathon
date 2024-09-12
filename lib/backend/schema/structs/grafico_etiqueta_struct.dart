// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GraficoEtiquetaStruct extends FFFirebaseStruct {
  GraficoEtiquetaStruct({
    String? etiquetas,
    double? gasto,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _etiquetas = etiquetas,
        _gasto = gasto,
        super(firestoreUtilData);

  // "etiquetas" field.
  String? _etiquetas;
  String get etiquetas => _etiquetas ?? '';
  set etiquetas(String? val) => _etiquetas = val;

  bool hasEtiquetas() => _etiquetas != null;

  // "gasto" field.
  double? _gasto;
  double get gasto => _gasto ?? 0.0;
  set gasto(double? val) => _gasto = val;

  void incrementGasto(double amount) => gasto = gasto + amount;

  bool hasGasto() => _gasto != null;

  static GraficoEtiquetaStruct fromMap(Map<String, dynamic> data) =>
      GraficoEtiquetaStruct(
        etiquetas: data['etiquetas'] as String?,
        gasto: castToType<double>(data['gasto']),
      );

  static GraficoEtiquetaStruct? maybeFromMap(dynamic data) => data is Map
      ? GraficoEtiquetaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'etiquetas': _etiquetas,
        'gasto': _gasto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'etiquetas': serializeParam(
          _etiquetas,
          ParamType.String,
        ),
        'gasto': serializeParam(
          _gasto,
          ParamType.double,
        ),
      }.withoutNulls;

  static GraficoEtiquetaStruct fromSerializableMap(Map<String, dynamic> data) =>
      GraficoEtiquetaStruct(
        etiquetas: deserializeParam(
          data['etiquetas'],
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
  String toString() => 'GraficoEtiquetaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GraficoEtiquetaStruct &&
        etiquetas == other.etiquetas &&
        gasto == other.gasto;
  }

  @override
  int get hashCode => const ListEquality().hash([etiquetas, gasto]);
}

GraficoEtiquetaStruct createGraficoEtiquetaStruct({
  String? etiquetas,
  double? gasto,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GraficoEtiquetaStruct(
      etiquetas: etiquetas,
      gasto: gasto,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GraficoEtiquetaStruct? updateGraficoEtiquetaStruct(
  GraficoEtiquetaStruct? graficoEtiqueta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    graficoEtiqueta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGraficoEtiquetaStructData(
  Map<String, dynamic> firestoreData,
  GraficoEtiquetaStruct? graficoEtiqueta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (graficoEtiqueta == null) {
    return;
  }
  if (graficoEtiqueta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && graficoEtiqueta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final graficoEtiquetaData =
      getGraficoEtiquetaFirestoreData(graficoEtiqueta, forFieldValue);
  final nestedData =
      graficoEtiquetaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = graficoEtiqueta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGraficoEtiquetaFirestoreData(
  GraficoEtiquetaStruct? graficoEtiqueta, [
  bool forFieldValue = false,
]) {
  if (graficoEtiqueta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(graficoEtiqueta.toMap());

  // Add any Firestore field values
  graficoEtiqueta.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGraficoEtiquetaListFirestoreData(
  List<GraficoEtiquetaStruct>? graficoEtiquetas,
) =>
    graficoEtiquetas
        ?.map((e) => getGraficoEtiquetaFirestoreData(e, true))
        .toList() ??
    [];
