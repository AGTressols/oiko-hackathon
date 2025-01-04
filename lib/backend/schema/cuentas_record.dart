import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CuentasRecord extends FirestoreRecord {
  CuentasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "cuenta" field.
  String? _cuenta;
  String get cuenta => _cuenta ?? '';
  bool hasCuenta() => _cuenta != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "activa" field.
  bool? _activa;
  bool get activa => _activa ?? false;
  bool hasActiva() => _activa != null;

  // "ahorro" field.
  bool? _ahorro;
  bool get ahorro => _ahorro ?? false;
  bool hasAhorro() => _ahorro != null;

  // "divisa" field.
  String? _divisa;
  String get divisa => _divisa ?? '';
  bool hasDivisa() => _divisa != null;

  // "ppp" field.
  double? _ppp;
  double get ppp => _ppp ?? 0.0;
  bool hasPpp() => _ppp != null;

  // "tap" field.
  double? _tap;
  double get tap => _tap ?? 0.0;
  bool hasTap() => _tap != null;

  // "tad" field.
  double? _tad;
  double get tad => _tad ?? 0.0;
  bool hasTad() => _tad != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _cuenta = snapshotData['cuenta'] as String?;
    _logo = snapshotData['logo'] as String?;
    _activa = snapshotData['activa'] as bool?;
    _ahorro = snapshotData['ahorro'] as bool?;
    _divisa = snapshotData['divisa'] as String?;
    _ppp = castToType<double>(snapshotData['ppp']);
    _tap = castToType<double>(snapshotData['tap']);
    _tad = castToType<double>(snapshotData['tad']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cuentas');

  static Stream<CuentasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CuentasRecord.fromSnapshot(s));

  static Future<CuentasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CuentasRecord.fromSnapshot(s));

  static CuentasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CuentasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CuentasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CuentasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CuentasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CuentasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCuentasRecordData({
  String? uid,
  String? cuenta,
  String? logo,
  bool? activa,
  bool? ahorro,
  String? divisa,
  double? ppp,
  double? tap,
  double? tad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'cuenta': cuenta,
      'logo': logo,
      'activa': activa,
      'ahorro': ahorro,
      'divisa': divisa,
      'ppp': ppp,
      'tap': tap,
      'tad': tad,
    }.withoutNulls,
  );

  return firestoreData;
}

class CuentasRecordDocumentEquality implements Equality<CuentasRecord> {
  const CuentasRecordDocumentEquality();

  @override
  bool equals(CuentasRecord? e1, CuentasRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.cuenta == e2?.cuenta &&
        e1?.logo == e2?.logo &&
        e1?.activa == e2?.activa &&
        e1?.ahorro == e2?.ahorro &&
        e1?.divisa == e2?.divisa &&
        e1?.ppp == e2?.ppp &&
        e1?.tap == e2?.tap &&
        e1?.tad == e2?.tad;
  }

  @override
  int hash(CuentasRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.cuenta,
        e?.logo,
        e?.activa,
        e?.ahorro,
        e?.divisa,
        e?.ppp,
        e?.tap,
        e?.tad
      ]);

  @override
  bool isValidKey(Object? o) => o is CuentasRecord;
}
