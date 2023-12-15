import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminRecord extends FirestoreRecord {
  AdminRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isFeedbackEnabled" field.
  bool? _isFeedbackEnabled;
  bool get isFeedbackEnabled => _isFeedbackEnabled ?? false;
  bool hasIsFeedbackEnabled() => _isFeedbackEnabled != null;

  // "isChatEnabled" field.
  bool? _isChatEnabled;
  bool get isChatEnabled => _isChatEnabled ?? false;
  bool hasIsChatEnabled() => _isChatEnabled != null;

  // "adminUserRef" field.
  DocumentReference? _adminUserRef;
  DocumentReference? get adminUserRef => _adminUserRef;
  bool hasAdminUserRef() => _adminUserRef != null;

  // "adminUid" field.
  String? _adminUid;
  String get adminUid => _adminUid ?? '';
  bool hasAdminUid() => _adminUid != null;

  void _initializeFields() {
    _isFeedbackEnabled = snapshotData['isFeedbackEnabled'] as bool?;
    _isChatEnabled = snapshotData['isChatEnabled'] as bool?;
    _adminUserRef = snapshotData['adminUserRef'] as DocumentReference?;
    _adminUid = snapshotData['adminUid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admin');

  static Stream<AdminRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminRecord.fromSnapshot(s));

  static Future<AdminRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminRecord.fromSnapshot(s));

  static AdminRecord fromSnapshot(DocumentSnapshot snapshot) => AdminRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminRecordData({
  bool? isFeedbackEnabled,
  bool? isChatEnabled,
  DocumentReference? adminUserRef,
  String? adminUid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isFeedbackEnabled': isFeedbackEnabled,
      'isChatEnabled': isChatEnabled,
      'adminUserRef': adminUserRef,
      'adminUid': adminUid,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminRecordDocumentEquality implements Equality<AdminRecord> {
  const AdminRecordDocumentEquality();

  @override
  bool equals(AdminRecord? e1, AdminRecord? e2) {
    return e1?.isFeedbackEnabled == e2?.isFeedbackEnabled &&
        e1?.isChatEnabled == e2?.isChatEnabled &&
        e1?.adminUserRef == e2?.adminUserRef &&
        e1?.adminUid == e2?.adminUid;
  }

  @override
  int hash(AdminRecord? e) => const ListEquality().hash(
      [e?.isFeedbackEnabled, e?.isChatEnabled, e?.adminUserRef, e?.adminUid]);

  @override
  bool isValidKey(Object? o) => o is AdminRecord;
}
