// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FlowCuentaStruct extends FFFirebaseStruct {
  FlowCuentaStruct({
    String? nombre,
    DocumentReference? cuentaRef,
    String? logo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombre = nombre,
        _cuentaRef = cuentaRef,
        _logo = logo,
        super(firestoreUtilData);

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "cuentaRef" field.
  DocumentReference? _cuentaRef;
  DocumentReference? get cuentaRef => _cuentaRef;
  set cuentaRef(DocumentReference? val) => _cuentaRef = val;

  bool hasCuentaRef() => _cuentaRef != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  static FlowCuentaStruct fromMap(Map<String, dynamic> data) =>
      FlowCuentaStruct(
        nombre: data['nombre'] as String?,
        cuentaRef: data['cuentaRef'] as DocumentReference?,
        logo: data['logo'] as String?,
      );

  static FlowCuentaStruct? maybeFromMap(dynamic data) => data is Map
      ? FlowCuentaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
        'cuentaRef': _cuentaRef,
        'logo': _logo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'cuentaRef': serializeParam(
          _cuentaRef,
          ParamType.DocumentReference,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
      }.withoutNulls;

  static FlowCuentaStruct fromSerializableMap(Map<String, dynamic> data) =>
      FlowCuentaStruct(
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        cuentaRef: deserializeParam(
          data['cuentaRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Cuentas'],
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FlowCuentaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlowCuentaStruct &&
        nombre == other.nombre &&
        cuentaRef == other.cuentaRef &&
        logo == other.logo;
  }

  @override
  int get hashCode => const ListEquality().hash([nombre, cuentaRef, logo]);
}

FlowCuentaStruct createFlowCuentaStruct({
  String? nombre,
  DocumentReference? cuentaRef,
  String? logo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FlowCuentaStruct(
      nombre: nombre,
      cuentaRef: cuentaRef,
      logo: logo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FlowCuentaStruct? updateFlowCuentaStruct(
  FlowCuentaStruct? flowCuenta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    flowCuenta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFlowCuentaStructData(
  Map<String, dynamic> firestoreData,
  FlowCuentaStruct? flowCuenta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (flowCuenta == null) {
    return;
  }
  if (flowCuenta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && flowCuenta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final flowCuentaData = getFlowCuentaFirestoreData(flowCuenta, forFieldValue);
  final nestedData = flowCuentaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = flowCuenta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFlowCuentaFirestoreData(
  FlowCuentaStruct? flowCuenta, [
  bool forFieldValue = false,
]) {
  if (flowCuenta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(flowCuenta.toMap());

  // Add any Firestore field values
  flowCuenta.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFlowCuentaListFirestoreData(
  List<FlowCuentaStruct>? flowCuentas,
) =>
    flowCuentas?.map((e) => getFlowCuentaFirestoreData(e, true)).toList() ?? [];
