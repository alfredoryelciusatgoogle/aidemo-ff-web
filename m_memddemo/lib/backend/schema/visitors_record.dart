import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitorsRecord extends FirestoreRecord {
  VisitorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "visitor_name" field.
  String? _visitorName;
  String get visitorName => _visitorName ?? '';
  bool hasVisitorName() => _visitorName != null;

  // "checkIn_time" field.
  DateTime? _checkInTime;
  DateTime? get checkInTime => _checkInTime;
  bool hasCheckInTime() => _checkInTime != null;

  // "checkOut_time" field.
  DateTime? _checkOutTime;
  DateTime? get checkOutTime => _checkOutTime;
  bool hasCheckOutTime() => _checkOutTime != null;

  // "visitor_phone" field.
  String? _visitorPhone;
  String get visitorPhone => _visitorPhone ?? '';
  bool hasVisitorPhone() => _visitorPhone != null;

  // "visitor_location_id" field.
  String? _visitorLocationId;
  String get visitorLocationId => _visitorLocationId ?? '';
  bool hasVisitorLocationId() => _visitorLocationId != null;

  void _initializeFields() {
    _visitorName = snapshotData['visitor_name'] as String?;
    _checkInTime = snapshotData['checkIn_time'] as DateTime?;
    _checkOutTime = snapshotData['checkOut_time'] as DateTime?;
    _visitorPhone = snapshotData['visitor_phone'] as String?;
    _visitorLocationId = snapshotData['visitor_location_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('visitors');

  static Stream<VisitorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitorsRecord.fromSnapshot(s));

  static Future<VisitorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitorsRecord.fromSnapshot(s));

  static VisitorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitorsRecordData({
  String? visitorName,
  DateTime? checkInTime,
  DateTime? checkOutTime,
  String? visitorPhone,
  String? visitorLocationId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'visitor_name': visitorName,
      'checkIn_time': checkInTime,
      'checkOut_time': checkOutTime,
      'visitor_phone': visitorPhone,
      'visitor_location_id': visitorLocationId,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitorsRecordDocumentEquality implements Equality<VisitorsRecord> {
  const VisitorsRecordDocumentEquality();

  @override
  bool equals(VisitorsRecord? e1, VisitorsRecord? e2) {
    return e1?.visitorName == e2?.visitorName &&
        e1?.checkInTime == e2?.checkInTime &&
        e1?.checkOutTime == e2?.checkOutTime &&
        e1?.visitorPhone == e2?.visitorPhone &&
        e1?.visitorLocationId == e2?.visitorLocationId;
  }

  @override
  int hash(VisitorsRecord? e) => const ListEquality().hash([
        e?.visitorName,
        e?.checkInTime,
        e?.checkOutTime,
        e?.visitorPhone,
        e?.visitorLocationId
      ]);

  @override
  bool isValidKey(Object? o) => o is VisitorsRecord;
}
