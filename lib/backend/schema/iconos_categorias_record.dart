import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IconosCategoriasRecord extends FirestoreRecord {
  IconosCategoriasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "icono" field.
  String? _icono;
  String get icono => _icono ?? '';
  bool hasIcono() => _icono != null;

  void _initializeFields() {
    _icono = snapshotData['icono'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('iconosCategorias');

  static Stream<IconosCategoriasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IconosCategoriasRecord.fromSnapshot(s));

  static Future<IconosCategoriasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => IconosCategoriasRecord.fromSnapshot(s));

  static IconosCategoriasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IconosCategoriasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IconosCategoriasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IconosCategoriasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IconosCategoriasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IconosCategoriasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIconosCategoriasRecordData({
  String? icono,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'icono': icono,
    }.withoutNulls,
  );

  return firestoreData;
}

class IconosCategoriasRecordDocumentEquality
    implements Equality<IconosCategoriasRecord> {
  const IconosCategoriasRecordDocumentEquality();

  @override
  bool equals(IconosCategoriasRecord? e1, IconosCategoriasRecord? e2) {
    return e1?.icono == e2?.icono;
  }

  @override
  int hash(IconosCategoriasRecord? e) => const ListEquality().hash([e?.icono]);

  @override
  bool isValidKey(Object? o) => o is IconosCategoriasRecord;
}
