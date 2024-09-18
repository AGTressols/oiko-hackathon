// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GraficoCategoriasIngresoStruct extends FFFirebaseStruct {
  GraficoCategoriasIngresoStruct({
    String? categoria,
    double? ingresoPorCategoriaAbs,
    double? porcentajeIngresoPorCategoria,
    int? ingresoPorCategoriaPX,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoria = categoria,
        _ingresoPorCategoriaAbs = ingresoPorCategoriaAbs,
        _porcentajeIngresoPorCategoria = porcentajeIngresoPorCategoria,
        _ingresoPorCategoriaPX = ingresoPorCategoriaPX,
        _color = color,
        super(firestoreUtilData);

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "ingresoPorCategoriaAbs" field.
  double? _ingresoPorCategoriaAbs;
  double get ingresoPorCategoriaAbs => _ingresoPorCategoriaAbs ?? 0.0;
  set ingresoPorCategoriaAbs(double? val) => _ingresoPorCategoriaAbs = val;

  void incrementIngresoPorCategoriaAbs(double amount) =>
      ingresoPorCategoriaAbs = ingresoPorCategoriaAbs + amount;

  bool hasIngresoPorCategoriaAbs() => _ingresoPorCategoriaAbs != null;

  // "porcentajeIngresoPorCategoria" field.
  double? _porcentajeIngresoPorCategoria;
  double get porcentajeIngresoPorCategoria =>
      _porcentajeIngresoPorCategoria ?? 0.0;
  set porcentajeIngresoPorCategoria(double? val) =>
      _porcentajeIngresoPorCategoria = val;

  void incrementPorcentajeIngresoPorCategoria(double amount) =>
      porcentajeIngresoPorCategoria = porcentajeIngresoPorCategoria + amount;

  bool hasPorcentajeIngresoPorCategoria() =>
      _porcentajeIngresoPorCategoria != null;

  // "ingresoPorCategoriaPX" field.
  int? _ingresoPorCategoriaPX;
  int get ingresoPorCategoriaPX => _ingresoPorCategoriaPX ?? 0;
  set ingresoPorCategoriaPX(int? val) => _ingresoPorCategoriaPX = val;

  void incrementIngresoPorCategoriaPX(int amount) =>
      ingresoPorCategoriaPX = ingresoPorCategoriaPX + amount;

  bool hasIngresoPorCategoriaPX() => _ingresoPorCategoriaPX != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static GraficoCategoriasIngresoStruct fromMap(Map<String, dynamic> data) =>
      GraficoCategoriasIngresoStruct(
        categoria: data['categoria'] as String?,
        ingresoPorCategoriaAbs:
            castToType<double>(data['ingresoPorCategoriaAbs']),
        porcentajeIngresoPorCategoria:
            castToType<double>(data['porcentajeIngresoPorCategoria']),
        ingresoPorCategoriaPX: castToType<int>(data['ingresoPorCategoriaPX']),
        color: getSchemaColor(data['color']),
      );

  static GraficoCategoriasIngresoStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? GraficoCategoriasIngresoStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'categoria': _categoria,
        'ingresoPorCategoriaAbs': _ingresoPorCategoriaAbs,
        'porcentajeIngresoPorCategoria': _porcentajeIngresoPorCategoria,
        'ingresoPorCategoriaPX': _ingresoPorCategoriaPX,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'ingresoPorCategoriaAbs': serializeParam(
          _ingresoPorCategoriaAbs,
          ParamType.double,
        ),
        'porcentajeIngresoPorCategoria': serializeParam(
          _porcentajeIngresoPorCategoria,
          ParamType.double,
        ),
        'ingresoPorCategoriaPX': serializeParam(
          _ingresoPorCategoriaPX,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static GraficoCategoriasIngresoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GraficoCategoriasIngresoStruct(
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        ingresoPorCategoriaAbs: deserializeParam(
          data['ingresoPorCategoriaAbs'],
          ParamType.double,
          false,
        ),
        porcentajeIngresoPorCategoria: deserializeParam(
          data['porcentajeIngresoPorCategoria'],
          ParamType.double,
          false,
        ),
        ingresoPorCategoriaPX: deserializeParam(
          data['ingresoPorCategoriaPX'],
          ParamType.int,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'GraficoCategoriasIngresoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GraficoCategoriasIngresoStruct &&
        categoria == other.categoria &&
        ingresoPorCategoriaAbs == other.ingresoPorCategoriaAbs &&
        porcentajeIngresoPorCategoria == other.porcentajeIngresoPorCategoria &&
        ingresoPorCategoriaPX == other.ingresoPorCategoriaPX &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([
        categoria,
        ingresoPorCategoriaAbs,
        porcentajeIngresoPorCategoria,
        ingresoPorCategoriaPX,
        color
      ]);
}

GraficoCategoriasIngresoStruct createGraficoCategoriasIngresoStruct({
  String? categoria,
  double? ingresoPorCategoriaAbs,
  double? porcentajeIngresoPorCategoria,
  int? ingresoPorCategoriaPX,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GraficoCategoriasIngresoStruct(
      categoria: categoria,
      ingresoPorCategoriaAbs: ingresoPorCategoriaAbs,
      porcentajeIngresoPorCategoria: porcentajeIngresoPorCategoria,
      ingresoPorCategoriaPX: ingresoPorCategoriaPX,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GraficoCategoriasIngresoStruct? updateGraficoCategoriasIngresoStruct(
  GraficoCategoriasIngresoStruct? graficoCategoriasIngreso, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    graficoCategoriasIngreso
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGraficoCategoriasIngresoStructData(
  Map<String, dynamic> firestoreData,
  GraficoCategoriasIngresoStruct? graficoCategoriasIngreso,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (graficoCategoriasIngreso == null) {
    return;
  }
  if (graficoCategoriasIngreso.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      graficoCategoriasIngreso.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final graficoCategoriasIngresoData = getGraficoCategoriasIngresoFirestoreData(
      graficoCategoriasIngreso, forFieldValue);
  final nestedData =
      graficoCategoriasIngresoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      graficoCategoriasIngreso.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGraficoCategoriasIngresoFirestoreData(
  GraficoCategoriasIngresoStruct? graficoCategoriasIngreso, [
  bool forFieldValue = false,
]) {
  if (graficoCategoriasIngreso == null) {
    return {};
  }
  final firestoreData = mapToFirestore(graficoCategoriasIngreso.toMap());

  // Add any Firestore field values
  graficoCategoriasIngreso.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGraficoCategoriasIngresoListFirestoreData(
  List<GraficoCategoriasIngresoStruct>? graficoCategoriasIngresos,
) =>
    graficoCategoriasIngresos
        ?.map((e) => getGraficoCategoriasIngresoFirestoreData(e, true))
        .toList() ??
    [];
