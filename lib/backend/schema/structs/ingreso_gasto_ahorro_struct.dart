// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IngresoGastoAhorroStruct extends FFFirebaseStruct {
  IngresoGastoAhorroStruct({
    String? fecha,
    double? totalIngreso,
    double? totalGasto,
    double? totalAhorro,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fecha = fecha,
        _totalIngreso = totalIngreso,
        _totalGasto = totalGasto,
        _totalAhorro = totalAhorro,
        super(firestoreUtilData);

  // "fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  set fecha(String? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

  // "totalIngreso" field.
  double? _totalIngreso;
  double get totalIngreso => _totalIngreso ?? 0.0;
  set totalIngreso(double? val) => _totalIngreso = val;

  void incrementTotalIngreso(double amount) =>
      totalIngreso = totalIngreso + amount;

  bool hasTotalIngreso() => _totalIngreso != null;

  // "totalGasto" field.
  double? _totalGasto;
  double get totalGasto => _totalGasto ?? 0.0;
  set totalGasto(double? val) => _totalGasto = val;

  void incrementTotalGasto(double amount) => totalGasto = totalGasto + amount;

  bool hasTotalGasto() => _totalGasto != null;

  // "totalAhorro" field.
  double? _totalAhorro;
  double get totalAhorro => _totalAhorro ?? 0.0;
  set totalAhorro(double? val) => _totalAhorro = val;

  void incrementTotalAhorro(double amount) =>
      totalAhorro = totalAhorro + amount;

  bool hasTotalAhorro() => _totalAhorro != null;

  static IngresoGastoAhorroStruct fromMap(Map<String, dynamic> data) =>
      IngresoGastoAhorroStruct(
        fecha: data['fecha'] as String?,
        totalIngreso: castToType<double>(data['totalIngreso']),
        totalGasto: castToType<double>(data['totalGasto']),
        totalAhorro: castToType<double>(data['totalAhorro']),
      );

  static IngresoGastoAhorroStruct? maybeFromMap(dynamic data) => data is Map
      ? IngresoGastoAhorroStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fecha': _fecha,
        'totalIngreso': _totalIngreso,
        'totalGasto': _totalGasto,
        'totalAhorro': _totalAhorro,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fecha': serializeParam(
          _fecha,
          ParamType.String,
        ),
        'totalIngreso': serializeParam(
          _totalIngreso,
          ParamType.double,
        ),
        'totalGasto': serializeParam(
          _totalGasto,
          ParamType.double,
        ),
        'totalAhorro': serializeParam(
          _totalAhorro,
          ParamType.double,
        ),
      }.withoutNulls;

  static IngresoGastoAhorroStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      IngresoGastoAhorroStruct(
        fecha: deserializeParam(
          data['fecha'],
          ParamType.String,
          false,
        ),
        totalIngreso: deserializeParam(
          data['totalIngreso'],
          ParamType.double,
          false,
        ),
        totalGasto: deserializeParam(
          data['totalGasto'],
          ParamType.double,
          false,
        ),
        totalAhorro: deserializeParam(
          data['totalAhorro'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'IngresoGastoAhorroStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IngresoGastoAhorroStruct &&
        fecha == other.fecha &&
        totalIngreso == other.totalIngreso &&
        totalGasto == other.totalGasto &&
        totalAhorro == other.totalAhorro;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fecha, totalIngreso, totalGasto, totalAhorro]);
}

IngresoGastoAhorroStruct createIngresoGastoAhorroStruct({
  String? fecha,
  double? totalIngreso,
  double? totalGasto,
  double? totalAhorro,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IngresoGastoAhorroStruct(
      fecha: fecha,
      totalIngreso: totalIngreso,
      totalGasto: totalGasto,
      totalAhorro: totalAhorro,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IngresoGastoAhorroStruct? updateIngresoGastoAhorroStruct(
  IngresoGastoAhorroStruct? ingresoGastoAhorro, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ingresoGastoAhorro
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIngresoGastoAhorroStructData(
  Map<String, dynamic> firestoreData,
  IngresoGastoAhorroStruct? ingresoGastoAhorro,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ingresoGastoAhorro == null) {
    return;
  }
  if (ingresoGastoAhorro.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ingresoGastoAhorro.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ingresoGastoAhorroData =
      getIngresoGastoAhorroFirestoreData(ingresoGastoAhorro, forFieldValue);
  final nestedData =
      ingresoGastoAhorroData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      ingresoGastoAhorro.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIngresoGastoAhorroFirestoreData(
  IngresoGastoAhorroStruct? ingresoGastoAhorro, [
  bool forFieldValue = false,
]) {
  if (ingresoGastoAhorro == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ingresoGastoAhorro.toMap());

  // Add any Firestore field values
  ingresoGastoAhorro.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIngresoGastoAhorroListFirestoreData(
  List<IngresoGastoAhorroStruct>? ingresoGastoAhorros,
) =>
    ingresoGastoAhorros
        ?.map((e) => getIngresoGastoAhorroFirestoreData(e, true))
        .toList() ??
    [];
