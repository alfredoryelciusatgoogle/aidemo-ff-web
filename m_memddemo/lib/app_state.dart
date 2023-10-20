import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _chatUserList = prefs
              .getStringList('ff_chatUserList')
              ?.map((path) => path.ref)
              .toList() ??
          _chatUserList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _locationID = 'de0ce31e-d2db-4f12-b8fb-77ccf70ee442';
  String get locationID => _locationID;
  set locationID(String _value) {
    _locationID = _value;
  }

  bool _isLoadingCompleted = false;
  bool get isLoadingCompleted => _isLoadingCompleted;
  set isLoadingCompleted(bool _value) {
    _isLoadingCompleted = _value;
  }

  String _capturedImageKey = 'captured_image';
  String get capturedImageKey => _capturedImageKey;
  set capturedImageKey(String _value) {
    _capturedImageKey = _value;
  }

  List<DocumentReference> _chatUserList = [
    FirebaseFirestore.instance.doc('/users/LocC2chwdXNTXu4XTrcdfBsidQ43')
  ];
  List<DocumentReference> get chatUserList => _chatUserList;
  set chatUserList(List<DocumentReference> _value) {
    _chatUserList = _value;
    prefs.setStringList('ff_chatUserList', _value.map((x) => x.path).toList());
  }

  void addToChatUserList(DocumentReference _value) {
    _chatUserList.add(_value);
    prefs.setStringList(
        'ff_chatUserList', _chatUserList.map((x) => x.path).toList());
  }

  void removeFromChatUserList(DocumentReference _value) {
    _chatUserList.remove(_value);
    prefs.setStringList(
        'ff_chatUserList', _chatUserList.map((x) => x.path).toList());
  }

  void removeAtIndexFromChatUserList(int _index) {
    _chatUserList.removeAt(_index);
    prefs.setStringList(
        'ff_chatUserList', _chatUserList.map((x) => x.path).toList());
  }

  void updateChatUserListAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _chatUserList[_index] = updateFn(_chatUserList[_index]);
    prefs.setStringList(
        'ff_chatUserList', _chatUserList.map((x) => x.path).toList());
  }

  void insertAtIndexInChatUserList(int _index, DocumentReference _value) {
    _chatUserList.insert(_index, _value);
    prefs.setStringList(
        'ff_chatUserList', _chatUserList.map((x) => x.path).toList());
  }

  String _currentTitle = '';
  String get currentTitle => _currentTitle;
  set currentTitle(String _value) {
    _currentTitle = _value;
  }

  String _currentDescription = '';
  String get currentDescription => _currentDescription;
  set currentDescription(String _value) {
    _currentDescription = _value;
  }

  String _currentLanguageCode = 'en';
  String get currentLanguageCode => _currentLanguageCode;
  set currentLanguageCode(String _value) {
    _currentLanguageCode = _value;
  }

  List<LanguagesStruct> _allLanguages = [
    LanguagesStruct.fromSerializableMap(
        jsonDecode('{\"language_name\":\"English\",\"language_code\":\"en\"}')),
    LanguagesStruct.fromSerializableMap(
        jsonDecode('{\"language_name\":\"French\",\"language_code\":\"fr\"}')),
    LanguagesStruct.fromSerializableMap(
        jsonDecode('{\"language_name\":\"Malay\",\"language_code\":\"ms\"}'))
  ];
  List<LanguagesStruct> get allLanguages => _allLanguages;
  set allLanguages(List<LanguagesStruct> _value) {
    _allLanguages = _value;
  }

  void addToAllLanguages(LanguagesStruct _value) {
    _allLanguages.add(_value);
  }

  void removeFromAllLanguages(LanguagesStruct _value) {
    _allLanguages.remove(_value);
  }

  void removeAtIndexFromAllLanguages(int _index) {
    _allLanguages.removeAt(_index);
  }

  void updateAllLanguagesAtIndex(
    int _index,
    LanguagesStruct Function(LanguagesStruct) updateFn,
  ) {
    _allLanguages[_index] = updateFn(_allLanguages[_index]);
  }

  void insertAtIndexInAllLanguages(int _index, LanguagesStruct _value) {
    _allLanguages.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
