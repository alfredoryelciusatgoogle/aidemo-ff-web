import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpectationsRecord extends FirestoreRecord {
  ExpectationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "expectations" field.
  String? _expectations;
  String get expectations => _expectations ?? '';
  bool hasExpectations() => _expectations != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _expectations = snapshotData['expectations'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('expectations');

  static Stream<ExpectationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExpectationsRecord.fromSnapshot(s));

  static Future<ExpectationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExpectationsRecord.fromSnapshot(s));

  static ExpectationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExpectationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpectationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpectationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpectationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpectationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpectationsRecordData({
  DocumentReference? userRef,
  String? expectations,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'expectations': expectations,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpectationsRecordDocumentEquality
    implements Equality<ExpectationsRecord> {
  const ExpectationsRecordDocumentEquality();

  @override
  bool equals(ExpectationsRecord? e1, ExpectationsRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.expectations == e2?.expectations;
  }

  @override
  int hash(ExpectationsRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.expectations]);

  @override
  bool isValidKey(Object? o) => o is ExpectationsRecord;
}
