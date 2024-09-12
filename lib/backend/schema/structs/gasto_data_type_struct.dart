// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GastoDataTypeStruct extends FFFirebaseStruct {
  GastoDataTypeStruct({
    String? categoria,
    String? etiqueta,
    double? monto,
    DateTime? fecha,
    String? cuenta,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoria = categoria,
        _etiqueta = etiqueta,
        _monto = monto,
        _fecha = fecha,
        _cuenta = cuenta,
        super(firestoreUtilData);

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "etiqueta" field.
  String? _etiqueta;
  String get etiqueta => _etiqueta ?? '';
  set etiqueta(String? val) => _etiqueta = val;

  bool hasEtiqueta() => _etiqueta != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  set monto(double? val) => _monto = val;

  void incrementMonto(double amount) => monto = monto + amount;

  bool hasMonto() => _monto != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  set fecha(DateTime? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

  // "cuenta" field.
  String? _cuenta;
  String get cuenta => _cuenta ?? '';
  set cuenta(String? val) => _cuenta = val;

  bool hasCuenta() => _cuenta != null;

  static GastoDataTypeStruct fromMap(Map<String, dynamic> data) =>
      GastoDataTypeStruct(
        categoria: data['categoria'] as String?,
        etiqueta: data['etiqueta'] as String?,
        monto: castToType<double>(data['monto']),
        fecha: data['fecha'] as DateTime?,
        cuenta: data['cuenta'] as String?,
      );

  static GastoDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? GastoDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'categoria': _categoria,
        'etiqueta': _etiqueta,
        'monto': _monto,
        'fecha': _fecha,
        'cuenta': _cuenta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'etiqueta': serializeParam(
          _etiqueta,
          ParamType.String,
        ),
        'monto': serializeParam(
          _monto,
          ParamType.double,
        ),
        'fecha': serializeParam(
          _fecha,
          ParamType.DateTime,
        ),
        'cuenta': serializeParam(
          _cuenta,
          ParamType.String,
        ),
      }.withoutNulls;

  static GastoDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      GastoDataTypeStruct(
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        etiqueta: deserializeParam(
          data['etiqueta'],
          ParamType.String,
          false,
        ),
        monto: deserializeParam(
          data['monto'],
          ParamType.double,
          false,
        ),
        fecha: deserializeParam(
          data['fecha'],
          ParamType.DateTime,
          false,
        ),
        cuenta: deserializeParam(
          data['cuenta'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GastoDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GastoDataTypeStruct &&
        categoria == other.categoria &&
        etiqueta == other.etiqueta &&
        monto == other.monto &&
        fecha == other.fecha &&
        cuenta == other.cuenta;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([categoria, etiqueta, monto, fecha, cuenta]);
}

GastoDataTypeStruct createGastoDataTypeStruct({
  String? categoria,
  String? etiqueta,
  double? monto,
  DateTime? fecha,
  String? cuenta,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GastoDataTypeStruct(
      categoria: categoria,
      etiqueta: etiqueta,
      monto: monto,
      fecha: fecha,
      cuenta: cuenta,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GastoDataTypeStruct? updateGastoDataTypeStruct(
  GastoDataTypeStruct? gastoDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gastoDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGastoDataTypeStructData(
  Map<String, dynamic> firestoreData,
  GastoDataTypeStruct? gastoDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gastoDataType == null) {
    return;
  }
  if (gastoDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gastoDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gastoDataTypeData =
      getGastoDataTypeFirestoreData(gastoDataType, forFieldValue);
  final nestedData =
      gastoDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gastoDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGastoDataTypeFirestoreData(
  GastoDataTypeStruct? gastoDataType, [
  bool forFieldValue = false,
]) {
  if (gastoDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gastoDataType.toMap());

  // Add any Firestore field values
  gastoDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGastoDataTypeListFirestoreData(
  List<GastoDataTypeStruct>? gastoDataTypes,
) =>
    gastoDataTypes
        ?.map((e) => getGastoDataTypeFirestoreData(e, true))
        .toList() ??
    [];
