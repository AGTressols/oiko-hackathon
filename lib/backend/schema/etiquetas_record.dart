import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EtiquetasRecord extends FirestoreRecord {
  EtiquetasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "categoria" field.
  DocumentReference? _categoria;
  DocumentReference? get categoria => _categoria;
  bool hasCategoria() => _categoria != null;

  // "etiqueta" field.
  String? _etiqueta;
  String get etiqueta => _etiqueta ?? '';
  bool hasEtiqueta() => _etiqueta != null;

  // "activa" field.
  bool? _activa;
  bool get activa => _activa ?? false;
  bool hasActiva() => _activa != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _categoria = snapshotData['categoria'] as DocumentReference?;
    _etiqueta = snapshotData['etiqueta'] as String?;
    _activa = snapshotData['activa'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Etiquetas');

  static Stream<EtiquetasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EtiquetasRecord.fromSnapshot(s));

  static Future<EtiquetasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EtiquetasRecord.fromSnapshot(s));

  static EtiquetasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EtiquetasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EtiquetasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EtiquetasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EtiquetasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EtiquetasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEtiquetasRecordData({
  String? uid,
  DocumentReference? categoria,
  String? etiqueta,
  bool? activa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'categoria': categoria,
      'etiqueta': etiqueta,
      'activa': activa,
    }.withoutNulls,
  );

  return firestoreData;
}

class EtiquetasRecordDocumentEquality implements Equality<EtiquetasRecord> {
  const EtiquetasRecordDocumentEquality();

  @override
  bool equals(EtiquetasRecord? e1, EtiquetasRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.categoria == e2?.categoria &&
        e1?.etiqueta == e2?.etiqueta &&
        e1?.activa == e2?.activa;
  }

  @override
  int hash(EtiquetasRecord? e) =>
      const ListEquality().hash([e?.uid, e?.categoria, e?.etiqueta, e?.activa]);

  @override
  bool isValidKey(Object? o) => o is EtiquetasRecord;
}
