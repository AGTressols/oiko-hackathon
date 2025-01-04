// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GraficoAhorroPorCuentaHijoStruct extends FFFirebaseStruct {
  GraficoAhorroPorCuentaHijoStruct({
    String? fecha,
    double? ahorroPorCuenta,
    Color? color,
    int? altura,
    String? cuentaAhorro,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fecha = fecha,
        _ahorroPorCuenta = ahorroPorCuenta,
        _color = color,
        _altura = altura,
        _cuentaAhorro = cuentaAhorro,
        super(firestoreUtilData);

  // "fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  set fecha(String? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

  // "ahorroPorCuenta" field.
  double? _ahorroPorCuenta;
  double get ahorroPorCuenta => _ahorroPorCuenta ?? 0.0;
  set ahorroPorCuenta(double? val) => _ahorroPorCuenta = val;

  void incrementAhorroPorCuenta(double amount) =>
      ahorroPorCuenta = ahorroPorCuenta + amount;

  bool hasAhorroPorCuenta() => _ahorroPorCuenta != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "altura" field.
  int? _altura;
  int get altura => _altura ?? 0;
  set altura(int? val) => _altura = val;

  void incrementAltura(int amount) => altura = altura + amount;

  bool hasAltura() => _altura != null;

  // "cuentaAhorro" field.
  String? _cuentaAhorro;
  String get cuentaAhorro => _cuentaAhorro ?? '';
  set cuentaAhorro(String? val) => _cuentaAhorro = val;

  bool hasCuentaAhorro() => _cuentaAhorro != null;

  static GraficoAhorroPorCuentaHijoStruct fromMap(Map<String, dynamic> data) =>
      GraficoAhorroPorCuentaHijoStruct(
        fecha: data['fecha'] as String?,
        ahorroPorCuenta: castToType<double>(data['ahorroPorCuenta']),
        color: getSchemaColor(data['color']),
        altura: castToType<int>(data['altura']),
        cuentaAhorro: data['cuentaAhorro'] as String?,
      );

  static GraficoAhorroPorCuentaHijoStruct? maybeFromMap(dynamic data) => data
          is Map
      ? GraficoAhorroPorCuentaHijoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fecha': _fecha,
        'ahorroPorCuenta': _ahorroPorCuenta,
        'color': _color,
        'altura': _altura,
        'cuentaAhorro': _cuentaAhorro,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fecha': serializeParam(
          _fecha,
          ParamType.String,
        ),
        'ahorroPorCuenta': serializeParam(
          _ahorroPorCuenta,
          ParamType.double,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'altura': serializeParam(
          _altura,
          ParamType.int,
        ),
        'cuentaAhorro': serializeParam(
          _cuentaAhorro,
          ParamType.String,
        ),
      }.withoutNulls;

  static GraficoAhorroPorCuentaHijoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GraficoAhorroPorCuentaHijoStruct(
        fecha: deserializeParam(
          data['fecha'],
          ParamType.String,
          false,
        ),
        ahorroPorCuenta: deserializeParam(
          data['ahorroPorCuenta'],
          ParamType.double,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        altura: deserializeParam(
          data['altura'],
          ParamType.int,
          false,
        ),
        cuentaAhorro: deserializeParam(
          data['cuentaAhorro'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GraficoAhorroPorCuentaHijoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GraficoAhorroPorCuentaHijoStruct &&
        fecha == other.fecha &&
        ahorroPorCuenta == other.ahorroPorCuenta &&
        color == other.color &&
        altura == other.altura &&
        cuentaAhorro == other.cuentaAhorro;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([fecha, ahorroPorCuenta, color, altura, cuentaAhorro]);
}

GraficoAhorroPorCuentaHijoStruct createGraficoAhorroPorCuentaHijoStruct({
  String? fecha,
  double? ahorroPorCuenta,
  Color? color,
  int? altura,
  String? cuentaAhorro,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GraficoAhorroPorCuentaHijoStruct(
      fecha: fecha,
      ahorroPorCuenta: ahorroPorCuenta,
      color: color,
      altura: altura,
      cuentaAhorro: cuentaAhorro,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GraficoAhorroPorCuentaHijoStruct? updateGraficoAhorroPorCuentaHijoStruct(
  GraficoAhorroPorCuentaHijoStruct? graficoAhorroPorCuentaHijo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    graficoAhorroPorCuentaHijo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGraficoAhorroPorCuentaHijoStructData(
  Map<String, dynamic> firestoreData,
  GraficoAhorroPorCuentaHijoStruct? graficoAhorroPorCuentaHijo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (graficoAhorroPorCuentaHijo == null) {
    return;
  }
  if (graficoAhorroPorCuentaHijo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      graficoAhorroPorCuentaHijo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final graficoAhorroPorCuentaHijoData =
      getGraficoAhorroPorCuentaHijoFirestoreData(
          graficoAhorroPorCuentaHijo, forFieldValue);
  final nestedData = graficoAhorroPorCuentaHijoData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      graficoAhorroPorCuentaHijo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGraficoAhorroPorCuentaHijoFirestoreData(
  GraficoAhorroPorCuentaHijoStruct? graficoAhorroPorCuentaHijo, [
  bool forFieldValue = false,
]) {
  if (graficoAhorroPorCuentaHijo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(graficoAhorroPorCuentaHijo.toMap());

  // Add any Firestore field values
  graficoAhorroPorCuentaHijo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGraficoAhorroPorCuentaHijoListFirestoreData(
  List<GraficoAhorroPorCuentaHijoStruct>? graficoAhorroPorCuentaHijos,
) =>
    graficoAhorroPorCuentaHijos
        ?.map((e) => getGraficoAhorroPorCuentaHijoFirestoreData(e, true))
        .toList() ??
    [];
