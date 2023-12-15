import '/auth/firebase_auth/auth_util.dart';
import '/auth_pages/confirm_logout/confirm_logout_widget.dart';
import '/auth_pages/select_language/select_language_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'product_details_widget.dart' show ProductDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsModel extends FlutterFlowModel<ProductDetailsWidget> {
  ///  Local state fields for this page.

  bool firstDescriptionCall = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - firebaseTokenRefresh] action in ProductDetails widget.
  String? returnedToken;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductDetails widget.
  TokensRecord? currentUserTokenRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TokensRecord? descriptionBotAuthToken;
  // Stores action output result for [Backend Call - API (generateDescription)] action in Button widget.
  ApiCallResponse? apiResulttvnCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TokensRecord? descriptionBotAuthToken2;
  // Stores action output result for [Backend Call - API (generateDescription)] action in Button widget.
  ApiCallResponse? apiResulttvnLanguage;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TokensRecord? descriptionBotAuthTokenCopy1;
  // Stores action output result for [Backend Call - API (generateDescriptionfromImage)] action in Button widget.
  ApiCallResponse? apiResultfromImage;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TokensRecord? descriptionBotAuthToken2Copy;
  // Stores action output result for [Backend Call - API (generateDescriptionfromImage)] action in Button widget.
  ApiCallResponse? apiResulttvnLanguageCopy;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
