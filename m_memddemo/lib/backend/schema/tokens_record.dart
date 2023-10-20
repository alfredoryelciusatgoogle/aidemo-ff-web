import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TokensRecord extends FirestoreRecord {
  TokensRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tokenId" field.
  String? _tokenId;
  String get tokenId => _tokenId ?? '';
  bool hasTokenId() => _tokenId != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  bool hasToken() => _token != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _tokenId = snapshotData['tokenId'] as String?;
    _token = snapshotData['token'] as String?;
    _userId = snapshotData['userId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tokens');

  static Stream<TokensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TokensRecord.fromSnapshot(s));

  static Future<TokensRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TokensRecord.fromSnapshot(s));

  static TokensRecord fromSnapshot(DocumentSnapshot snapshot) => TokensRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TokensRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TokensRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TokensRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TokensRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTokensRecordData({
  String? tokenId,
  String? token,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tokenId': tokenId,
      'token': token,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TokensRecordDocumentEquality implements Equality<TokensRecord> {
  const TokensRecordDocumentEquality();

  @override
  bool equals(TokensRecord? e1, TokensRecord? e2) {
    return e1?.tokenId == e2?.tokenId &&
        e1?.token == e2?.token &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(TokensRecord? e) =>
      const ListEquality().hash([e?.tokenId, e?.token, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is TokensRecord;
}
