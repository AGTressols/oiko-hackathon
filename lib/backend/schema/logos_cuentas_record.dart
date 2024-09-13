import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogosCuentasRecord extends FirestoreRecord {
  LogosCuentasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  void _initializeFields() {
    _logo = snapshotData['logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('logosCuentas');

  static Stream<LogosCuentasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogosCuentasRecord.fromSnapshot(s));

  static Future<LogosCuentasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogosCuentasRecord.fromSnapshot(s));

  static LogosCuentasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LogosCuentasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogosCuentasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogosCuentasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogosCuentasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogosCuentasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogosCuentasRecordData({
  String? logo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'logo': logo,
    }.withoutNulls,
  );

  return firestoreData;
}

class LogosCuentasRecordDocumentEquality
    implements Equality<LogosCuentasRecord> {
  const LogosCuentasRecordDocumentEquality();

  @override
  bool equals(LogosCuentasRecord? e1, LogosCuentasRecord? e2) {
    return e1?.logo == e2?.logo;
  }

  @override
  int hash(LogosCuentasRecord? e) => const ListEquality().hash([e?.logo]);

  @override
  bool isValidKey(Object? o) => o is LogosCuentasRecord;
}
