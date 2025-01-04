// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GraficoAhorroCuentaStruct extends FFFirebaseStruct {
  GraficoAhorroCuentaStruct({
    String? fecha,
    double? ahorro,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fecha = fecha,
        _ahorro = ahorro,
        super(firestoreUtilData);

  // "fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  set fecha(String? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

  // "ahorro" field.
  double? _ahorro;
  double get ahorro => _ahorro ?? 0.0;
  set ahorro(double? val) => _ahorro = val;

  void incrementAhorro(double amount) => ahorro = ahorro + amount;

  bool hasAhorro() => _ahorro != null;

  static GraficoAhorroCuentaStruct fromMap(Map<String, dynamic> data) =>
      GraficoAhorroCuentaStruct(
        fecha: data['fecha'] as String?,
        ahorro: castToType<double>(data['ahorro']),
      );

  static GraficoAhorroCuentaStruct? maybeFromMap(dynamic data) => data is Map
      ? GraficoAhorroCuentaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fecha': _fecha,
        'ahorro': _ahorro,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fecha': serializeParam(
          _fecha,
          ParamType.String,
        ),
        'ahorro': serializeParam(
          _ahorro,
          ParamType.double,
        ),
      }.withoutNulls;

  static GraficoAhorroCuentaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GraficoAhorroCuentaStruct(
        fecha: deserializeParam(
          data['fecha'],
          ParamType.String,
          false,
        ),
        ahorro: deserializeParam(
          data['ahorro'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'GraficoAhorroCuentaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GraficoAhorroCuentaStruct &&
        fecha == other.fecha &&
        ahorro == other.ahorro;
  }

  @override
  int get hashCode => const ListEquality().hash([fecha, ahorro]);
}

GraficoAhorroCuentaStruct createGraficoAhorroCuentaStruct({
  String? fecha,
  double? ahorro,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GraficoAhorroCuentaStruct(
      fecha: fecha,
      ahorro: ahorro,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GraficoAhorroCuentaStruct? updateGraficoAhorroCuentaStruct(
  GraficoAhorroCuentaStruct? graficoAhorroCuenta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    graficoAhorroCuenta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGraficoAhorroCuentaStructData(
  Map<String, dynamic> firestoreData,
  GraficoAhorroCuentaStruct? graficoAhorroCuenta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (graficoAhorroCuenta == null) {
    return;
  }
  if (graficoAhorroCuenta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && graficoAhorroCuenta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final graficoAhorroCuentaData =
      getGraficoAhorroCuentaFirestoreData(graficoAhorroCuenta, forFieldValue);
  final nestedData =
      graficoAhorroCuentaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      graficoAhorroCuenta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGraficoAhorroCuentaFirestoreData(
  GraficoAhorroCuentaStruct? graficoAhorroCuenta, [
  bool forFieldValue = false,
]) {
  if (graficoAhorroCuenta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(graficoAhorroCuenta.toMap());

  // Add any Firestore field values
  graficoAhorroCuenta.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGraficoAhorroCuentaListFirestoreData(
  List<GraficoAhorroCuentaStruct>? graficoAhorroCuentas,
) =>
    graficoAhorroCuentas
        ?.map((e) => getGraficoAhorroCuentaFirestoreData(e, true))
        .toList() ??
    [];
