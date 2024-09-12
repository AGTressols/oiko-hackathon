import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriasRecord extends FirestoreRecord {
  CategoriasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "movimiento" field.
  String? _movimiento;
  String get movimiento => _movimiento ?? '';
  bool hasMovimiento() => _movimiento != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "presupuesto" field.
  double? _presupuesto;
  double get presupuesto => _presupuesto ?? 0.0;
  bool hasPresupuesto() => _presupuesto != null;

  // "activa" field.
  bool? _activa;
  bool get activa => _activa ?? false;
  bool hasActiva() => _activa != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _movimiento = snapshotData['movimiento'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _logo = snapshotData['logo'] as String?;
    _presupuesto = castToType<double>(snapshotData['presupuesto']);
    _activa = snapshotData['activa'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Categorias');

  static Stream<CategoriasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriasRecord.fromSnapshot(s));

  static Future<CategoriasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriasRecord.fromSnapshot(s));

  static CategoriasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriasRecordData({
  String? uid,
  String? movimiento,
  String? categoria,
  String? logo,
  double? presupuesto,
  bool? activa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'movimiento': movimiento,
      'categoria': categoria,
      'logo': logo,
      'presupuesto': presupuesto,
      'activa': activa,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriasRecordDocumentEquality implements Equality<CategoriasRecord> {
  const CategoriasRecordDocumentEquality();

  @override
  bool equals(CategoriasRecord? e1, CategoriasRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.movimiento == e2?.movimiento &&
        e1?.categoria == e2?.categoria &&
        e1?.logo == e2?.logo &&
        e1?.presupuesto == e2?.presupuesto &&
        e1?.activa == e2?.activa;
  }

  @override
  int hash(CategoriasRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.movimiento,
        e?.categoria,
        e?.logo,
        e?.presupuesto,
        e?.activa
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoriasRecord;
}
