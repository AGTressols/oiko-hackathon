import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransaccionesRecord extends FirestoreRecord {
  TransaccionesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "movimiento" field.
  String? _movimiento;
  String get movimiento => _movimiento ?? '';
  bool hasMovimiento() => _movimiento != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "cuenta" field.
  DocumentReference? _cuenta;
  DocumentReference? get cuenta => _cuenta;
  bool hasCuenta() => _cuenta != null;

  // "categoria" field.
  DocumentReference? _categoria;
  DocumentReference? get categoria => _categoria;
  bool hasCategoria() => _categoria != null;

  // "etiqueta" field.
  DocumentReference? _etiqueta;
  DocumentReference? get etiqueta => _etiqueta;
  bool hasEtiqueta() => _etiqueta != null;

  // "observacion" field.
  String? _observacion;
  String get observacion => _observacion ?? '';
  bool hasObservacion() => _observacion != null;

  // "cuentaCredito" field.
  DocumentReference? _cuentaCredito;
  DocumentReference? get cuentaCredito => _cuentaCredito;
  bool hasCuentaCredito() => _cuentaCredito != null;

  // "traspasoCuenta" field.
  DocumentReference? _traspasoCuenta;
  DocumentReference? get traspasoCuenta => _traspasoCuenta;
  bool hasTraspasoCuenta() => _traspasoCuenta != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _movimiento = snapshotData['movimiento'] as String?;
    _monto = castToType<double>(snapshotData['monto']);
    _cuenta = snapshotData['cuenta'] as DocumentReference?;
    _categoria = snapshotData['categoria'] as DocumentReference?;
    _etiqueta = snapshotData['etiqueta'] as DocumentReference?;
    _observacion = snapshotData['observacion'] as String?;
    _cuentaCredito = snapshotData['cuentaCredito'] as DocumentReference?;
    _traspasoCuenta = snapshotData['traspasoCuenta'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Transacciones');

  static Stream<TransaccionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransaccionesRecord.fromSnapshot(s));

  static Future<TransaccionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransaccionesRecord.fromSnapshot(s));

  static TransaccionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransaccionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransaccionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransaccionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransaccionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransaccionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransaccionesRecordData({
  String? uid,
  DateTime? fecha,
  String? movimiento,
  double? monto,
  DocumentReference? cuenta,
  DocumentReference? categoria,
  DocumentReference? etiqueta,
  String? observacion,
  DocumentReference? cuentaCredito,
  DocumentReference? traspasoCuenta,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'fecha': fecha,
      'movimiento': movimiento,
      'monto': monto,
      'cuenta': cuenta,
      'categoria': categoria,
      'etiqueta': etiqueta,
      'observacion': observacion,
      'cuentaCredito': cuentaCredito,
      'traspasoCuenta': traspasoCuenta,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransaccionesRecordDocumentEquality
    implements Equality<TransaccionesRecord> {
  const TransaccionesRecordDocumentEquality();

  @override
  bool equals(TransaccionesRecord? e1, TransaccionesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.fecha == e2?.fecha &&
        e1?.movimiento == e2?.movimiento &&
        e1?.monto == e2?.monto &&
        e1?.cuenta == e2?.cuenta &&
        e1?.categoria == e2?.categoria &&
        e1?.etiqueta == e2?.etiqueta &&
        e1?.observacion == e2?.observacion &&
        e1?.cuentaCredito == e2?.cuentaCredito &&
        e1?.traspasoCuenta == e2?.traspasoCuenta;
  }

  @override
  int hash(TransaccionesRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.fecha,
        e?.movimiento,
        e?.monto,
        e?.cuenta,
        e?.categoria,
        e?.etiqueta,
        e?.observacion,
        e?.cuentaCredito,
        e?.traspasoCuenta
      ]);

  @override
  bool isValidKey(Object? o) => o is TransaccionesRecord;
}
