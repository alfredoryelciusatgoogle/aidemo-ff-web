import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SketchesRecord extends FirestoreRecord {
  SketchesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "sketchURL" field.
  String? _sketchURL;
  String get sketchURL => _sketchURL ?? '';
  bool hasSketchURL() => _sketchURL != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "sketch_description" field.
  String? _sketchDescription;
  String get sketchDescription => _sketchDescription ?? '';
  bool hasSketchDescription() => _sketchDescription != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _sketchURL = snapshotData['sketchURL'] as String?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _sketchDescription = snapshotData['sketch_description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sketches');

  static Stream<SketchesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SketchesRecord.fromSnapshot(s));

  static Future<SketchesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SketchesRecord.fromSnapshot(s));

  static SketchesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SketchesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SketchesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SketchesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SketchesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SketchesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSketchesRecordData({
  DocumentReference? userRef,
  String? sketchURL,
  DateTime? timeCreated,
  String? sketchDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'sketchURL': sketchURL,
      'time_created': timeCreated,
      'sketch_description': sketchDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class SketchesRecordDocumentEquality implements Equality<SketchesRecord> {
  const SketchesRecordDocumentEquality();

  @override
  bool equals(SketchesRecord? e1, SketchesRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.sketchURL == e2?.sketchURL &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.sketchDescription == e2?.sketchDescription;
  }

  @override
  int hash(SketchesRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.sketchURL, e?.timeCreated, e?.sketchDescription]);

  @override
  bool isValidKey(Object? o) => o is SketchesRecord;
}
