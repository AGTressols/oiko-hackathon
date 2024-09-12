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

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _cuenta = snapshotData['cuenta'] as String?;
    _logo = snapshotData['logo'] as String?;
    _activa = snapshotData['activa'] as bool?;
    _ahorro = snapshotData['ahorro'] as bool?;
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
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'cuenta': cuenta,
      'logo': logo,
      'activa': activa,
      'ahorro': ahorro,
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
        e1?.ahorro == e2?.ahorro;
  }

  @override
  int hash(CuentasRecord? e) => const ListEquality()
      .hash([e?.uid, e?.cuenta, e?.logo, e?.activa, e?.ahorro]);

  @override
  bool isValidKey(Object? o) => o is CuentasRecord;
}
