// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GraficoAhorroPorCuentaPadreStruct extends FFFirebaseStruct {
  GraficoAhorroPorCuentaPadreStruct({
    String? fecha,
    double? ahorroTotalMes,
    int? alturaDataType,
    double? tAhorro,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fecha = fecha,
        _ahorroTotalMes = ahorroTotalMes,
        _alturaDataType = alturaDataType,
        _tAhorro = tAhorro,
        super(firestoreUtilData);

  // "fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  set fecha(String? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

  // "ahorroTotalMes" field.
  double? _ahorroTotalMes;
  double get ahorroTotalMes => _ahorroTotalMes ?? 0.0;
  set ahorroTotalMes(double? val) => _ahorroTotalMes = val;

  void incrementAhorroTotalMes(double amount) =>
      ahorroTotalMes = ahorroTotalMes + amount;

  bool hasAhorroTotalMes() => _ahorroTotalMes != null;

  // "alturaDataType" field.
  int? _alturaDataType;
  int get alturaDataType => _alturaDataType ?? 0;
  set alturaDataType(int? val) => _alturaDataType = val;

  void incrementAlturaDataType(int amount) =>
      alturaDataType = alturaDataType + amount;

  bool hasAlturaDataType() => _alturaDataType != null;

  // "tAhorro" field.
  double? _tAhorro;
  double get tAhorro => _tAhorro ?? 0.0;
  set tAhorro(double? val) => _tAhorro = val;

  void incrementTAhorro(double amount) => tAhorro = tAhorro + amount;

  bool hasTAhorro() => _tAhorro != null;

  static GraficoAhorroPorCuentaPadreStruct fromMap(Map<String, dynamic> data) =>
      GraficoAhorroPorCuentaPadreStruct(
        fecha: data['fecha'] as String?,
        ahorroTotalMes: castToType<double>(data['ahorroTotalMes']),
        alturaDataType: castToType<int>(data['alturaDataType']),
        tAhorro: castToType<double>(data['tAhorro']),
      );

  static GraficoAhorroPorCuentaPadreStruct? maybeFromMap(dynamic data) => data
          is Map
      ? GraficoAhorroPorCuentaPadreStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fecha': _fecha,
        'ahorroTotalMes': _ahorroTotalMes,
        'alturaDataType': _alturaDataType,
        'tAhorro': _tAhorro,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fecha': serializeParam(
          _fecha,
          ParamType.String,
        ),
        'ahorroTotalMes': serializeParam(
          _ahorroTotalMes,
          ParamType.double,
        ),
        'alturaDataType': serializeParam(
          _alturaDataType,
          ParamType.int,
        ),
        'tAhorro': serializeParam(
          _tAhorro,
          ParamType.double,
        ),
      }.withoutNulls;

  static GraficoAhorroPorCuentaPadreStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GraficoAhorroPorCuentaPadreStruct(
        fecha: deserializeParam(
          data['fecha'],
          ParamType.String,
          false,
        ),
        ahorroTotalMes: deserializeParam(
          data['ahorroTotalMes'],
          ParamType.double,
          false,
        ),
        alturaDataType: deserializeParam(
          data['alturaDataType'],
          ParamType.int,
          false,
        ),
        tAhorro: deserializeParam(
          data['tAhorro'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'GraficoAhorroPorCuentaPadreStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GraficoAhorroPorCuentaPadreStruct &&
        fecha == other.fecha &&
        ahorroTotalMes == other.ahorroTotalMes &&
        alturaDataType == other.alturaDataType &&
        tAhorro == other.tAhorro;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([fecha, ahorroTotalMes, alturaDataType, tAhorro]);
}

GraficoAhorroPorCuentaPadreStruct createGraficoAhorroPorCuentaPadreStruct({
  String? fecha,
  double? ahorroTotalMes,
  int? alturaDataType,
  double? tAhorro,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GraficoAhorroPorCuentaPadreStruct(
      fecha: fecha,
      ahorroTotalMes: ahorroTotalMes,
      alturaDataType: alturaDataType,
      tAhorro: tAhorro,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GraficoAhorroPorCuentaPadreStruct? updateGraficoAhorroPorCuentaPadreStruct(
  GraficoAhorroPorCuentaPadreStruct? graficoAhorroPorCuentaPadre, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    graficoAhorroPorCuentaPadre
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGraficoAhorroPorCuentaPadreStructData(
  Map<String, dynamic> firestoreData,
  GraficoAhorroPorCuentaPadreStruct? graficoAhorroPorCuentaPadre,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (graficoAhorroPorCuentaPadre == null) {
    return;
  }
  if (graficoAhorroPorCuentaPadre.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      graficoAhorroPorCuentaPadre.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final graficoAhorroPorCuentaPadreData =
      getGraficoAhorroPorCuentaPadreFirestoreData(
          graficoAhorroPorCuentaPadre, forFieldValue);
  final nestedData = graficoAhorroPorCuentaPadreData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      graficoAhorroPorCuentaPadre.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGraficoAhorroPorCuentaPadreFirestoreData(
  GraficoAhorroPorCuentaPadreStruct? graficoAhorroPorCuentaPadre, [
  bool forFieldValue = false,
]) {
  if (graficoAhorroPorCuentaPadre == null) {
    return {};
  }
  final firestoreData = mapToFirestore(graficoAhorroPorCuentaPadre.toMap());

  // Add any Firestore field values
  graficoAhorroPorCuentaPadre.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGraficoAhorroPorCuentaPadreListFirestoreData(
  List<GraficoAhorroPorCuentaPadreStruct>? graficoAhorroPorCuentaPadres,
) =>
    graficoAhorroPorCuentaPadres
        ?.map((e) => getGraficoAhorroPorCuentaPadreFirestoreData(e, true))
        .toList() ??
    [];
