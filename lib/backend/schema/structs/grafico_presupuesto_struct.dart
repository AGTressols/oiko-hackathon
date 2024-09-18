// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GraficoPresupuestoStruct extends FFFirebaseStruct {
  GraficoPresupuestoStruct({
    String? categoria,
    String? logo,
    int? gastadoAbs,
    int? presupuestoDisponible,
    int? presupuestoGrafico,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoria = categoria,
        _logo = logo,
        _gastadoAbs = gastadoAbs,
        _presupuestoDisponible = presupuestoDisponible,
        _presupuestoGrafico = presupuestoGrafico,
        _color = color,
        super(firestoreUtilData);

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "gastadoAbs" field.
  int? _gastadoAbs;
  int get gastadoAbs => _gastadoAbs ?? 0;
  set gastadoAbs(int? val) => _gastadoAbs = val;

  void incrementGastadoAbs(int amount) => gastadoAbs = gastadoAbs + amount;

  bool hasGastadoAbs() => _gastadoAbs != null;

  // "presupuestoDisponible" field.
  int? _presupuestoDisponible;
  int get presupuestoDisponible => _presupuestoDisponible ?? 0;
  set presupuestoDisponible(int? val) => _presupuestoDisponible = val;

  void incrementPresupuestoDisponible(int amount) =>
      presupuestoDisponible = presupuestoDisponible + amount;

  bool hasPresupuestoDisponible() => _presupuestoDisponible != null;

  // "presupuestoGrafico" field.
  int? _presupuestoGrafico;
  int get presupuestoGrafico => _presupuestoGrafico ?? 0;
  set presupuestoGrafico(int? val) => _presupuestoGrafico = val;

  void incrementPresupuestoGrafico(int amount) =>
      presupuestoGrafico = presupuestoGrafico + amount;

  bool hasPresupuestoGrafico() => _presupuestoGrafico != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  static GraficoPresupuestoStruct fromMap(Map<String, dynamic> data) =>
      GraficoPresupuestoStruct(
        categoria: data['categoria'] as String?,
        logo: data['logo'] as String?,
        gastadoAbs: castToType<int>(data['gastadoAbs']),
        presupuestoDisponible: castToType<int>(data['presupuestoDisponible']),
        presupuestoGrafico: castToType<int>(data['presupuestoGrafico']),
        color: getSchemaColor(data['color']),
      );

  static GraficoPresupuestoStruct? maybeFromMap(dynamic data) => data is Map
      ? GraficoPresupuestoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'categoria': _categoria,
        'logo': _logo,
        'gastadoAbs': _gastadoAbs,
        'presupuestoDisponible': _presupuestoDisponible,
        'presupuestoGrafico': _presupuestoGrafico,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'gastadoAbs': serializeParam(
          _gastadoAbs,
          ParamType.int,
        ),
        'presupuestoDisponible': serializeParam(
          _presupuestoDisponible,
          ParamType.int,
        ),
        'presupuestoGrafico': serializeParam(
          _presupuestoGrafico,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static GraficoPresupuestoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GraficoPresupuestoStruct(
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        gastadoAbs: deserializeParam(
          data['gastadoAbs'],
          ParamType.int,
          false,
        ),
        presupuestoDisponible: deserializeParam(
          data['presupuestoDisponible'],
          ParamType.int,
          false,
        ),
        presupuestoGrafico: deserializeParam(
          data['presupuestoGrafico'],
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
  String toString() => 'GraficoPresupuestoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GraficoPresupuestoStruct &&
        categoria == other.categoria &&
        logo == other.logo &&
        gastadoAbs == other.gastadoAbs &&
        presupuestoDisponible == other.presupuestoDisponible &&
        presupuestoGrafico == other.presupuestoGrafico &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([
        categoria,
        logo,
        gastadoAbs,
        presupuestoDisponible,
        presupuestoGrafico,
        color
      ]);
}

GraficoPresupuestoStruct createGraficoPresupuestoStruct({
  String? categoria,
  String? logo,
  int? gastadoAbs,
  int? presupuestoDisponible,
  int? presupuestoGrafico,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GraficoPresupuestoStruct(
      categoria: categoria,
      logo: logo,
      gastadoAbs: gastadoAbs,
      presupuestoDisponible: presupuestoDisponible,
      presupuestoGrafico: presupuestoGrafico,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GraficoPresupuestoStruct? updateGraficoPresupuestoStruct(
  GraficoPresupuestoStruct? graficoPresupuesto, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    graficoPresupuesto
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGraficoPresupuestoStructData(
  Map<String, dynamic> firestoreData,
  GraficoPresupuestoStruct? graficoPresupuesto,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (graficoPresupuesto == null) {
    return;
  }
  if (graficoPresupuesto.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && graficoPresupuesto.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final graficoPresupuestoData =
      getGraficoPresupuestoFirestoreData(graficoPresupuesto, forFieldValue);
  final nestedData =
      graficoPresupuestoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      graficoPresupuesto.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGraficoPresupuestoFirestoreData(
  GraficoPresupuestoStruct? graficoPresupuesto, [
  bool forFieldValue = false,
]) {
  if (graficoPresupuesto == null) {
    return {};
  }
  final firestoreData = mapToFirestore(graficoPresupuesto.toMap());

  // Add any Firestore field values
  graficoPresupuesto.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGraficoPresupuestoListFirestoreData(
  List<GraficoPresupuestoStruct>? graficoPresupuestos,
) =>
    graficoPresupuestos
        ?.map((e) => getGraficoPresupuestoFirestoreData(e, true))
        .toList() ??
    [];
