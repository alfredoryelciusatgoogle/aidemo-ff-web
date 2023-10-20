import '/auth/firebase_auth/auth_util.dart';
import '/auth_pages/confirm_logout/confirm_logout_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/place_holder_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'results_page_widget.dart' show ResultsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultsPageModel extends FlutterFlowModel<ResultsPageWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (fetchItems)] action in ResultsPage widget.
  ApiCallResponse? textSearchResponse;
  // Stores action output result for [Backend Call - API (fetchItems Image Search)] action in ResultsPage widget.
  ApiCallResponse? imageSearchResponse;
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
