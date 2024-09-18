// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GraficoHistoricoIngresoStruct extends FFFirebaseStruct {
  GraficoHistoricoIngresoStruct({
    String? fecha,
    double? ingresoTotalMes,
    int? alturaDataType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fecha = fecha,
        _ingresoTotalMes = ingresoTotalMes,
        _alturaDataType = alturaDataType,
        super(firestoreUtilData);

  // "fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  set fecha(String? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

  // "ingresoTotalMes" field.
  double? _ingresoTotalMes;
  double get ingresoTotalMes => _ingresoTotalMes ?? 0.0;
  set ingresoTotalMes(double? val) => _ingresoTotalMes = val;

  void incrementIngresoTotalMes(double amount) =>
      ingresoTotalMes = ingresoTotalMes + amount;

  bool hasIngresoTotalMes() => _ingresoTotalMes != null;

  // "alturaDataType" field.
  int? _alturaDataType;
  int get alturaDataType => _alturaDataType ?? 0;
  set alturaDataType(int? val) => _alturaDataType = val;

  void incrementAlturaDataType(int amount) =>
      alturaDataType = alturaDataType + amount;

  bool hasAlturaDataType() => _alturaDataType != null;

  static GraficoHistoricoIngresoStruct fromMap(Map<String, dynamic> data) =>
      GraficoHistoricoIngresoStruct(
        fecha: data['fecha'] as String?,
        ingresoTotalMes: castToType<double>(data['ingresoTotalMes']),
        alturaDataType: castToType<int>(data['alturaDataType']),
      );

  static GraficoHistoricoIngresoStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? GraficoHistoricoIngresoStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'fecha': _fecha,
        'ingresoTotalMes': _ingresoTotalMes,
        'alturaDataType': _alturaDataType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fecha': serializeParam(
          _fecha,
          ParamType.String,
        ),
        'ingresoTotalMes': serializeParam(
          _ingresoTotalMes,
          ParamType.double,
        ),
        'alturaDataType': serializeParam(
          _alturaDataType,
          ParamType.int,
        ),
      }.withoutNulls;

  static GraficoHistoricoIngresoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GraficoHistoricoIngresoStruct(
        fecha: deserializeParam(
          data['fecha'],
          ParamType.String,
          false,
        ),
        ingresoTotalMes: deserializeParam(
          data['ingresoTotalMes'],
          ParamType.double,
          false,
        ),
        alturaDataType: deserializeParam(
          data['alturaDataType'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GraficoHistoricoIngresoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GraficoHistoricoIngresoStruct &&
        fecha == other.fecha &&
        ingresoTotalMes == other.ingresoTotalMes &&
        alturaDataType == other.alturaDataType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fecha, ingresoTotalMes, alturaDataType]);
}

GraficoHistoricoIngresoStruct createGraficoHistoricoIngresoStruct({
  String? fecha,
  double? ingresoTotalMes,
  int? alturaDataType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GraficoHistoricoIngresoStruct(
      fecha: fecha,
      ingresoTotalMes: ingresoTotalMes,
      alturaDataType: alturaDataType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GraficoHistoricoIngresoStruct? updateGraficoHistoricoIngresoStruct(
  GraficoHistoricoIngresoStruct? graficoHistoricoIngreso, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    graficoHistoricoIngreso
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGraficoHistoricoIngresoStructData(
  Map<String, dynamic> firestoreData,
  GraficoHistoricoIngresoStruct? graficoHistoricoIngreso,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (graficoHistoricoIngreso == null) {
    return;
  }
  if (graficoHistoricoIngreso.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      graficoHistoricoIngreso.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final graficoHistoricoIngresoData = getGraficoHistoricoIngresoFirestoreData(
      graficoHistoricoIngreso, forFieldValue);
  final nestedData =
      graficoHistoricoIngresoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      graficoHistoricoIngreso.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGraficoHistoricoIngresoFirestoreData(
  GraficoHistoricoIngresoStruct? graficoHistoricoIngreso, [
  bool forFieldValue = false,
]) {
  if (graficoHistoricoIngreso == null) {
    return {};
  }
  final firestoreData = mapToFirestore(graficoHistoricoIngreso.toMap());

  // Add any Firestore field values
  graficoHistoricoIngreso.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGraficoHistoricoIngresoListFirestoreData(
  List<GraficoHistoricoIngresoStruct>? graficoHistoricoIngresos,
) =>
    graficoHistoricoIngresos
        ?.map((e) => getGraficoHistoricoIngresoFirestoreData(e, true))
        .toList() ??
    [];
