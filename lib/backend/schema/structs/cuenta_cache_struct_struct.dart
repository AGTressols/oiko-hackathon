// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CuentaCacheStructStruct extends FFFirebaseStruct {
  CuentaCacheStructStruct({
    String? id,
    String? cuenta,
    String? logo,
    bool? activa,
    bool? ahorro,
    String? divisa,
    double? ppp,
    double? tap,
    double? tad,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _cuenta = cuenta,
        _logo = logo,
        _activa = activa,
        _ahorro = ahorro,
        _divisa = divisa,
        _ppp = ppp,
        _tap = tap,
        _tad = tad,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "cuenta" field.
  String? _cuenta;
  String get cuenta => _cuenta ?? '';
  set cuenta(String? val) => _cuenta = val;

  bool hasCuenta() => _cuenta != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "activa" field.
  bool? _activa;
  bool get activa => _activa ?? false;
  set activa(bool? val) => _activa = val;

  bool hasActiva() => _activa != null;

  // "ahorro" field.
  bool? _ahorro;
  bool get ahorro => _ahorro ?? false;
  set ahorro(bool? val) => _ahorro = val;

  bool hasAhorro() => _ahorro != null;

  // "divisa" field.
  String? _divisa;
  String get divisa => _divisa ?? '';
  set divisa(String? val) => _divisa = val;

  bool hasDivisa() => _divisa != null;

  // "ppp" field.
  double? _ppp;
  double get ppp => _ppp ?? 0.0;
  set ppp(double? val) => _ppp = val;

  void incrementPpp(double amount) => ppp = ppp + amount;

  bool hasPpp() => _ppp != null;

  // "tap" field.
  double? _tap;
  double get tap => _tap ?? 0.0;
  set tap(double? val) => _tap = val;

  void incrementTap(double amount) => tap = tap + amount;

  bool hasTap() => _tap != null;

  // "tad" field.
  double? _tad;
  double get tad => _tad ?? 0.0;
  set tad(double? val) => _tad = val;

  void incrementTad(double amount) => tad = tad + amount;

  bool hasTad() => _tad != null;

  static CuentaCacheStructStruct fromMap(Map<String, dynamic> data) =>
      CuentaCacheStructStruct(
        id: data['id'] as String?,
        cuenta: data['cuenta'] as String?,
        logo: data['logo'] as String?,
        activa: data['activa'] as bool?,
        ahorro: data['ahorro'] as bool?,
        divisa: data['divisa'] as String?,
        ppp: castToType<double>(data['ppp']),
        tap: castToType<double>(data['tap']),
        tad: castToType<double>(data['tad']),
      );

  static CuentaCacheStructStruct? maybeFromMap(dynamic data) => data is Map
      ? CuentaCacheStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'cuenta': _cuenta,
        'logo': _logo,
        'activa': _activa,
        'ahorro': _ahorro,
        'divisa': _divisa,
        'ppp': _ppp,
        'tap': _tap,
        'tad': _tad,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'cuenta': serializeParam(
          _cuenta,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'activa': serializeParam(
          _activa,
          ParamType.bool,
        ),
        'ahorro': serializeParam(
          _ahorro,
          ParamType.bool,
        ),
        'divisa': serializeParam(
          _divisa,
          ParamType.String,
        ),
        'ppp': serializeParam(
          _ppp,
          ParamType.double,
        ),
        'tap': serializeParam(
          _tap,
          ParamType.double,
        ),
        'tad': serializeParam(
          _tad,
          ParamType.double,
        ),
      }.withoutNulls;

  static CuentaCacheStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CuentaCacheStructStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        cuenta: deserializeParam(
          data['cuenta'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        activa: deserializeParam(
          data['activa'],
          ParamType.bool,
          false,
        ),
        ahorro: deserializeParam(
          data['ahorro'],
          ParamType.bool,
          false,
        ),
        divisa: deserializeParam(
          data['divisa'],
          ParamType.String,
          false,
        ),
        ppp: deserializeParam(
          data['ppp'],
          ParamType.double,
          false,
        ),
        tap: deserializeParam(
          data['tap'],
          ParamType.double,
          false,
        ),
        tad: deserializeParam(
          data['tad'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CuentaCacheStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CuentaCacheStructStruct &&
        id == other.id &&
        cuenta == other.cuenta &&
        logo == other.logo &&
        activa == other.activa &&
        ahorro == other.ahorro &&
        divisa == other.divisa &&
        ppp == other.ppp &&
        tap == other.tap &&
        tad == other.tad;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, cuenta, logo, activa, ahorro, divisa, ppp, tap, tad]);
}

CuentaCacheStructStruct createCuentaCacheStructStruct({
  String? id,
  String? cuenta,
  String? logo,
  bool? activa,
  bool? ahorro,
  String? divisa,
  double? ppp,
  double? tap,
  double? tad,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CuentaCacheStructStruct(
      id: id,
      cuenta: cuenta,
      logo: logo,
      activa: activa,
      ahorro: ahorro,
      divisa: divisa,
      ppp: ppp,
      tap: tap,
      tad: tad,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CuentaCacheStructStruct? updateCuentaCacheStructStruct(
  CuentaCacheStructStruct? cuentaCacheStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cuentaCacheStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCuentaCacheStructStructData(
  Map<String, dynamic> firestoreData,
  CuentaCacheStructStruct? cuentaCacheStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cuentaCacheStruct == null) {
    return;
  }
  if (cuentaCacheStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cuentaCacheStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cuentaCacheStructData =
      getCuentaCacheStructFirestoreData(cuentaCacheStruct, forFieldValue);
  final nestedData =
      cuentaCacheStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cuentaCacheStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCuentaCacheStructFirestoreData(
  CuentaCacheStructStruct? cuentaCacheStruct, [
  bool forFieldValue = false,
]) {
  if (cuentaCacheStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cuentaCacheStruct.toMap());

  // Add any Firestore field values
  cuentaCacheStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCuentaCacheStructListFirestoreData(
  List<CuentaCacheStructStruct>? cuentaCacheStructs,
) =>
    cuentaCacheStructs
        ?.map((e) => getCuentaCacheStructFirestoreData(e, true))
        .toList() ??
    [];
