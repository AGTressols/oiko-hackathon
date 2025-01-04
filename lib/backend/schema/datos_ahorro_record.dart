import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DatosAhorroRecord extends FirestoreRecord {
  DatosAhorroRecord._(
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
  DocumentReference? _cuenta;
  DocumentReference? get cuenta => _cuenta;
  bool hasCuenta() => _cuenta != null;

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

  // "divisa" field.
  String? _divisa;
  String get divisa => _divisa ?? '';
  bool hasDivisa() => _divisa != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _cuenta = snapshotData['cuenta'] as DocumentReference?;
    _ppp = castToType<double>(snapshotData['ppp']);
    _tap = castToType<double>(snapshotData['tap']);
    _tad = castToType<double>(snapshotData['tad']);
    _divisa = snapshotData['divisa'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('datosAhorro');

  static Stream<DatosAhorroRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DatosAhorroRecord.fromSnapshot(s));

  static Future<DatosAhorroRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DatosAhorroRecord.fromSnapshot(s));

  static DatosAhorroRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DatosAhorroRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DatosAhorroRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DatosAhorroRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DatosAhorroRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DatosAhorroRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDatosAhorroRecordData({
  String? uid,
  DocumentReference? cuenta,
  double? ppp,
  double? tap,
  double? tad,
  String? divisa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'cuenta': cuenta,
      'ppp': ppp,
      'tap': tap,
      'tad': tad,
      'divisa': divisa,
    }.withoutNulls,
  );

  return firestoreData;
}

class DatosAhorroRecordDocumentEquality implements Equality<DatosAhorroRecord> {
  const DatosAhorroRecordDocumentEquality();

  @override
  bool equals(DatosAhorroRecord? e1, DatosAhorroRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.cuenta == e2?.cuenta &&
        e1?.ppp == e2?.ppp &&
        e1?.tap == e2?.tap &&
        e1?.tad == e2?.tad &&
        e1?.divisa == e2?.divisa;
  }

  @override
  int hash(DatosAhorroRecord? e) => const ListEquality()
      .hash([e?.uid, e?.cuenta, e?.ppp, e?.tap, e?.tad, e?.divisa]);

  @override
  bool isValidKey(Object? o) => o is DatosAhorroRecord;
}
