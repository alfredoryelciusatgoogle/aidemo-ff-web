import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackRecord extends FirestoreRecord {
  FeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "userRole" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "userCompany" field.
  String? _userCompany;
  String get userCompany => _userCompany ?? '';
  bool hasUserCompany() => _userCompany != null;

  // "whatUserLiked" field.
  String? _whatUserLiked;
  String get whatUserLiked => _whatUserLiked ?? '';
  bool hasWhatUserLiked() => _whatUserLiked != null;

  // "whatUserWantsMoreOf" field.
  String? _whatUserWantsMoreOf;
  String get whatUserWantsMoreOf => _whatUserWantsMoreOf ?? '';
  bool hasWhatUserWantsMoreOf() => _whatUserWantsMoreOf != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "contactMe" field.
  bool? _contactMe;
  bool get contactMe => _contactMe ?? false;
  bool hasContactMe() => _contactMe != null;

  // "emailAddress" field.
  String? _emailAddress;
  String get emailAddress => _emailAddress ?? '';
  bool hasEmailAddress() => _emailAddress != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _userRole = snapshotData['userRole'] as String?;
    _userCompany = snapshotData['userCompany'] as String?;
    _whatUserLiked = snapshotData['whatUserLiked'] as String?;
    _whatUserWantsMoreOf = snapshotData['whatUserWantsMoreOf'] as String?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _contactMe = snapshotData['contactMe'] as bool?;
    _emailAddress = snapshotData['emailAddress'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback');

  static Stream<FeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackRecord.fromSnapshot(s));

  static Future<FeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackRecord.fromSnapshot(s));

  static FeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackRecordData({
  DocumentReference? userRef,
  String? userRole,
  String? userCompany,
  String? whatUserLiked,
  String? whatUserWantsMoreOf,
  DateTime? timeCreated,
  bool? contactMe,
  String? emailAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'userRole': userRole,
      'userCompany': userCompany,
      'whatUserLiked': whatUserLiked,
      'whatUserWantsMoreOf': whatUserWantsMoreOf,
      'time_created': timeCreated,
      'contactMe': contactMe,
      'emailAddress': emailAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackRecordDocumentEquality implements Equality<FeedbackRecord> {
  const FeedbackRecordDocumentEquality();

  @override
  bool equals(FeedbackRecord? e1, FeedbackRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.userRole == e2?.userRole &&
        e1?.userCompany == e2?.userCompany &&
        e1?.whatUserLiked == e2?.whatUserLiked &&
        e1?.whatUserWantsMoreOf == e2?.whatUserWantsMoreOf &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.contactMe == e2?.contactMe &&
        e1?.emailAddress == e2?.emailAddress;
  }

  @override
  int hash(FeedbackRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.userRole,
        e?.userCompany,
        e?.whatUserLiked,
        e?.whatUserWantsMoreOf,
        e?.timeCreated,
        e?.contactMe,
        e?.emailAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is FeedbackRecord;
}
