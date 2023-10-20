// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LanguagesStruct extends FFFirebaseStruct {
  LanguagesStruct({
    String? languageName,
    String? languageCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _languageName = languageName,
        _languageCode = languageCode,
        super(firestoreUtilData);

  // "language_name" field.
  String? _languageName;
  String get languageName => _languageName ?? '';
  set languageName(String? val) => _languageName = val;
  bool hasLanguageName() => _languageName != null;

  // "language_code" field.
  String? _languageCode;
  String get languageCode => _languageCode ?? '';
  set languageCode(String? val) => _languageCode = val;
  bool hasLanguageCode() => _languageCode != null;

  static LanguagesStruct fromMap(Map<String, dynamic> data) => LanguagesStruct(
        languageName: data['language_name'] as String?,
        languageCode: data['language_code'] as String?,
      );

  static LanguagesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? LanguagesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'language_name': _languageName,
        'language_code': _languageCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'language_name': serializeParam(
          _languageName,
          ParamType.String,
        ),
        'language_code': serializeParam(
          _languageCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static LanguagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      LanguagesStruct(
        languageName: deserializeParam(
          data['language_name'],
          ParamType.String,
          false,
        ),
        languageCode: deserializeParam(
          data['language_code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LanguagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LanguagesStruct &&
        languageName == other.languageName &&
        languageCode == other.languageCode;
  }

  @override
  int get hashCode => const ListEquality().hash([languageName, languageCode]);
}

LanguagesStruct createLanguagesStruct({
  String? languageName,
  String? languageCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LanguagesStruct(
      languageName: languageName,
      languageCode: languageCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LanguagesStruct? updateLanguagesStruct(
  LanguagesStruct? languages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    languages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLanguagesStructData(
  Map<String, dynamic> firestoreData,
  LanguagesStruct? languages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (languages == null) {
    return;
  }
  if (languages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && languages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final languagesData = getLanguagesFirestoreData(languages, forFieldValue);
  final nestedData = languagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = languages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLanguagesFirestoreData(
  LanguagesStruct? languages, [
  bool forFieldValue = false,
]) {
  if (languages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(languages.toMap());

  // Add any Firestore field values
  languages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLanguagesListFirestoreData(
  List<LanguagesStruct>? languagess,
) =>
    languagess?.map((e) => getLanguagesFirestoreData(e, true)).toList() ?? [];
