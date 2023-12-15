import '/auth/firebase_auth/auth_util.dart';
import '/auth_pages/confirm_logout/confirm_logout_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'results_widget.dart' show ResultsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultsModel extends FlutterFlowModel<ResultsWidget> {
  ///  Local state fields for this page.

  bool isTextApiSearchSuccessful = false;

  bool isImageApiSearchSuccessful = false;

  List<dynamic> results = [];
  void addToResults(dynamic item) => results.add(item);
  void removeFromResults(dynamic item) => results.remove(item);
  void removeAtIndexFromResults(int index) => results.removeAt(index);
  void insertAtIndexInResults(int index, dynamic item) =>
      results.insert(index, item);
  void updateResultsAtIndex(int index, Function(dynamic) updateFn) =>
      results[index] = updateFn(results[index]);

  String? searchKeyword = '';

  FFUploadedFile? uploadedImageBytesData;

  List<bool> isItemHovered = [];
  void addToIsItemHovered(bool item) => isItemHovered.add(item);
  void removeFromIsItemHovered(bool item) => isItemHovered.remove(item);
  void removeAtIndexFromIsItemHovered(int index) =>
      isItemHovered.removeAt(index);
  void insertAtIndexInIsItemHovered(int index, bool item) =>
      isItemHovered.insert(index, item);
  void updateIsItemHoveredAtIndex(int index, Function(bool) updateFn) =>
      isItemHovered[index] = updateFn(isItemHovered[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (fetchItems)] action in Results widget.
  ApiCallResponse? textSearchResponseCopy;
  // Stores action output result for [Backend Call - API (fetchItems Image Search)] action in Results widget.
  ApiCallResponse? imageSearchResponseCopy;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
