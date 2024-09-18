// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriasIngresoHistoricoStruct extends FFFirebaseStruct {
  CategoriasIngresoHistoricoStruct({
    String? fecha,
    double? ingresoPorCategoria,
    Color? color,
    int? altura,
    String? categoria,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fecha = fecha,
        _ingresoPorCategoria = ingresoPorCategoria,
        _color = color,
        _altura = altura,
        _categoria = categoria,
        super(firestoreUtilData);

  // "fecha" field.
  String? _fecha;
  String get fecha => _fecha ?? '';
  set fecha(String? val) => _fecha = val;

  bool hasFecha() => _fecha != null;

  // "ingresoPorCategoria" field.
  double? _ingresoPorCategoria;
  double get ingresoPorCategoria => _ingresoPorCategoria ?? 0.0;
  set ingresoPorCategoria(double? val) => _ingresoPorCategoria = val;

  void incrementIngresoPorCategoria(double amount) =>
      ingresoPorCategoria = ingresoPorCategoria + amount;

  bool hasIngresoPorCategoria() => _ingresoPorCategoria != null;

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

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  static CategoriasIngresoHistoricoStruct fromMap(Map<String, dynamic> data) =>
      CategoriasIngresoHistoricoStruct(
        fecha: data['fecha'] as String?,
        ingresoPorCategoria: castToType<double>(data['ingresoPorCategoria']),
        color: getSchemaColor(data['color']),
        altura: castToType<int>(data['altura']),
        categoria: data['categoria'] as String?,
      );

  static CategoriasIngresoHistoricoStruct? maybeFromMap(dynamic data) => data
          is Map
      ? CategoriasIngresoHistoricoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fecha': _fecha,
        'ingresoPorCategoria': _ingresoPorCategoria,
        'color': _color,
        'altura': _altura,
        'categoria': _categoria,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fecha': serializeParam(
          _fecha,
          ParamType.String,
        ),
        'ingresoPorCategoria': serializeParam(
          _ingresoPorCategoria,
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
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoriasIngresoHistoricoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CategoriasIngresoHistoricoStruct(
        fecha: deserializeParam(
          data['fecha'],
          ParamType.String,
          false,
        ),
        ingresoPorCategoria: deserializeParam(
          data['ingresoPorCategoria'],
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
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CategoriasIngresoHistoricoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriasIngresoHistoricoStruct &&
        fecha == other.fecha &&
        ingresoPorCategoria == other.ingresoPorCategoria &&
        color == other.color &&
        altura == other.altura &&
        categoria == other.categoria;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([fecha, ingresoPorCategoria, color, altura, categoria]);
}

CategoriasIngresoHistoricoStruct createCategoriasIngresoHistoricoStruct({
  String? fecha,
  double? ingresoPorCategoria,
  Color? color,
  int? altura,
  String? categoria,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoriasIngresoHistoricoStruct(
      fecha: fecha,
      ingresoPorCategoria: ingresoPorCategoria,
      color: color,
      altura: altura,
      categoria: categoria,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoriasIngresoHistoricoStruct? updateCategoriasIngresoHistoricoStruct(
  CategoriasIngresoHistoricoStruct? categoriasIngresoHistorico, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categoriasIngresoHistorico
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoriasIngresoHistoricoStructData(
  Map<String, dynamic> firestoreData,
  CategoriasIngresoHistoricoStruct? categoriasIngresoHistorico,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categoriasIngresoHistorico == null) {
    return;
  }
  if (categoriasIngresoHistorico.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      categoriasIngresoHistorico.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoriasIngresoHistoricoData =
      getCategoriasIngresoHistoricoFirestoreData(
          categoriasIngresoHistorico, forFieldValue);
  final nestedData = categoriasIngresoHistoricoData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      categoriasIngresoHistorico.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoriasIngresoHistoricoFirestoreData(
  CategoriasIngresoHistoricoStruct? categoriasIngresoHistorico, [
  bool forFieldValue = false,
]) {
  if (categoriasIngresoHistorico == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categoriasIngresoHistorico.toMap());

  // Add any Firestore field values
  categoriasIngresoHistorico.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoriasIngresoHistoricoListFirestoreData(
  List<CategoriasIngresoHistoricoStruct>? categoriasIngresoHistoricos,
) =>
    categoriasIngresoHistoricos
        ?.map((e) => getCategoriasIngresoHistoricoFirestoreData(e, true))
        .toList() ??
    [];
