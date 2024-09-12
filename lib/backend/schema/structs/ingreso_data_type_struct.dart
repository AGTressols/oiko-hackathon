// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IngresoDataTypeStruct extends FFFirebaseStruct {
  IngresoDataTypeStruct({
    String? categoria,
    double? monto,
    DateTime? fecha,
    String? cuenta,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoria = categoria,
        _monto = monto,
        _fecha = fecha,
        _cuenta = cuenta,
        super(firestoreUtilData);

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

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

  static IngresoDataTypeStruct fromMap(Map<String, dynamic> data) =>
      IngresoDataTypeStruct(
        categoria: data['categoria'] as String?,
        monto: castToType<double>(data['monto']),
        fecha: data['fecha'] as DateTime?,
        cuenta: data['cuenta'] as String?,
      );

  static IngresoDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? IngresoDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'categoria': _categoria,
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

  static IngresoDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      IngresoDataTypeStruct(
        categoria: deserializeParam(
          data['categoria'],
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
  String toString() => 'IngresoDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IngresoDataTypeStruct &&
        categoria == other.categoria &&
        monto == other.monto &&
        fecha == other.fecha &&
        cuenta == other.cuenta;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([categoria, monto, fecha, cuenta]);
}

IngresoDataTypeStruct createIngresoDataTypeStruct({
  String? categoria,
  double? monto,
  DateTime? fecha,
  String? cuenta,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IngresoDataTypeStruct(
      categoria: categoria,
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

IngresoDataTypeStruct? updateIngresoDataTypeStruct(
  IngresoDataTypeStruct? ingresoDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ingresoDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIngresoDataTypeStructData(
  Map<String, dynamic> firestoreData,
  IngresoDataTypeStruct? ingresoDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ingresoDataType == null) {
    return;
  }
  if (ingresoDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ingresoDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ingresoDataTypeData =
      getIngresoDataTypeFirestoreData(ingresoDataType, forFieldValue);
  final nestedData =
      ingresoDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ingresoDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIngresoDataTypeFirestoreData(
  IngresoDataTypeStruct? ingresoDataType, [
  bool forFieldValue = false,
]) {
  if (ingresoDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ingresoDataType.toMap());

  // Add any Firestore field values
  ingresoDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIngresoDataTypeListFirestoreData(
  List<IngresoDataTypeStruct>? ingresoDataTypes,
) =>
    ingresoDataTypes
        ?.map((e) => getIngresoDataTypeFirestoreData(e, true))
        .toList() ??
    [];
