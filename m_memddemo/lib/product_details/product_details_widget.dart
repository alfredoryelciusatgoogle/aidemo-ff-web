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
import 'product_details_model.dart';
export 'product_details_model.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    Key? key,
    required this.productData,
  }) : super(key: key);

  final dynamic productData;

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget>
    with TickerProviderStateMixin {
  late ProductDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 140.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProductDetails'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PRODUCT_DETAILS_ProductDetails_ON_INIT_S');
      logFirebaseEvent('ProductDetails_update_page_state');
      setState(() {
        _model.firstDescriptionCall = true;
      });
      logFirebaseEvent('ProductDetails_custom_action');
      _model.returnedToken = await actions.firebaseTokenRefresh();
      logFirebaseEvent('ProductDetails_firestore_query');
      _model.currentUserTokenRef = await queryTokensRecordOnce(
        queryBuilder: (tokensRecord) => tokensRecord
            .where(
              'tokenId',
              isEqualTo: 'DESCRIPTIONBOT',
            )
            .where(
              'userId',
              isEqualTo: currentUserReference,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('ProductDetails_backend_call');

      await _model.currentUserTokenRef!.reference.update(createTokensRecordData(
        token: _model.returnedToken,
      ));
      logFirebaseEvent('ProductDetails_show_snack_bar');
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 16.0),
                          child: Hero(
                            tag: getJsonField(
                              widget.productData,
                              r'''$.image''',
                            ),
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.network(
                                getJsonField(
                                  widget.productData,
                                  r'''$.image''',
                                ),
                                width: double.infinity,
                                height: 430.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFAppState().currentTitle,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 16.0),
                          child: Text(
                            FFAppState().currentDescription,
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation']!),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 12.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PRODUCT_DETAILS_DESCRIPTION_FROM_TITLE_B');
                                var _shouldSetState = false;
                                if (_model.firstDescriptionCall) {
                                  logFirebaseEvent('Button_firestore_query');
                                  _model.descriptionBotAuthToken =
                                      await queryTokensRecordOnce(
                                    queryBuilder: (tokensRecord) =>
                                        tokensRecord.where(
                                      'tokenId',
                                      isEqualTo: 'DESCRIPTIONBOT',
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _shouldSetState = true;
                                  logFirebaseEvent('Button_backend_call');
                                  _model.apiResulttvnCopy =
                                      await GenerateDescriptionCall.call(
                                    title: getJsonField(
                                      widget.productData,
                                      r'''$.title''',
                                    ).toString(),
                                    language: 'en',
                                    descriptionBotToken:
                                        _model.descriptionBotAuthToken?.token,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.apiResulttvnCopy?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Button_update_app_state');
                                    setState(() {
                                      FFAppState().currentDescription =
                                          (_model.apiResulttvnCopy?.bodyText ??
                                              '');
                                    });
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.firstDescriptionCall = false;
                                    });
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'API call failed',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Product Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  logFirebaseEvent('Button_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SelectLanguageWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  logFirebaseEvent('Button_firestore_query');
                                  _model.descriptionBotAuthToken2 =
                                      await queryTokensRecordOnce(
                                    queryBuilder: (tokensRecord) =>
                                        tokensRecord.where(
                                      'tokenId',
                                      isEqualTo: 'DESCRIPTIONBOT',
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _shouldSetState = true;
                                  logFirebaseEvent('Button_backend_call');
                                  _model.apiResulttvnLanguage =
                                      await GenerateDescriptionCall.call(
                                    title: getJsonField(
                                      widget.productData,
                                      r'''$.title''',
                                    ).toString(),
                                    language: FFAppState().currentLanguageCode,
                                    descriptionBotToken:
                                        _model.descriptionBotAuthToken2?.token,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.apiResulttvnLanguage?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Button_update_app_state');
                                    setState(() {
                                      FFAppState().currentDescription = (_model
                                              .apiResulttvnLanguage?.bodyText ??
                                          '');
                                    });
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.firstDescriptionCall = false;
                                    });
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'API call failed',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Product Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'cah7zcf7' /* Description from Title */,
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.magic,
                              ),
                              options: FFButtonOptions(
                                width: 193.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Product Sans',
                                      color: Colors.white,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 12.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'PRODUCT_DETAILS_DESCRIPTION_FROM_IMAGE_B');
                                var _shouldSetState = false;
                                if (_model.firstDescriptionCall) {
                                  logFirebaseEvent('Button_firestore_query');
                                  _model.descriptionBotAuthTokenCopy1 =
                                      await queryTokensRecordOnce(
                                    queryBuilder: (tokensRecord) =>
                                        tokensRecord.where(
                                      'tokenId',
                                      isEqualTo: 'DESCRIPTIONBOT',
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _shouldSetState = true;
                                  logFirebaseEvent('Button_backend_call');
                                  _model.apiResultfromImage =
                                      await GenerateDescriptionfromImageCall
                                          .call(
                                    imageUrl: getJsonField(
                                      widget.productData,
                                      r'''$.image''',
                                    ).toString(),
                                    language: FFAppState().currentLanguageCode,
                                    descriptionBotToken: _model
                                        .descriptionBotAuthTokenCopy1?.token,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.apiResultfromImage?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Button_update_app_state');
                                    setState(() {
                                      FFAppState().currentDescription = (_model
                                              .apiResultfromImage?.bodyText ??
                                          '');
                                    });
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.firstDescriptionCall = false;
                                    });
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'API call failed',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Product Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  logFirebaseEvent('Button_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SelectLanguageWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  logFirebaseEvent('Button_firestore_query');
                                  _model.descriptionBotAuthToken2Copy =
                                      await queryTokensRecordOnce(
                                    queryBuilder: (tokensRecord) =>
                                        tokensRecord.where(
                                      'tokenId',
                                      isEqualTo: 'DESCRIPTIONBOT',
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _shouldSetState = true;
                                  logFirebaseEvent('Button_backend_call');
                                  _model.apiResulttvnLanguageCopy =
                                      await GenerateDescriptionfromImageCall
                                          .call(
                                    imageUrl: getJsonField(
                                      widget.productData,
                                      r'''$.image''',
                                    ).toString(),
                                    language: FFAppState().currentLanguageCode,
                                    descriptionBotToken: _model
                                        .descriptionBotAuthToken2Copy?.token,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.apiResulttvnLanguageCopy
                                          ?.succeeded ??
                                      true)) {
                                    logFirebaseEvent('Button_update_app_state');
                                    setState(() {
                                      FFAppState().currentDescription = (_model
                                              .apiResulttvnLanguageCopy
                                              ?.bodyText ??
                                          '');
                                    });
                                    logFirebaseEvent(
                                        'Button_update_page_state');
                                    setState(() {
                                      _model.firstDescriptionCall = false;
                                    });
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'API call failed',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Product Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '14bntzxn' /* Description from Image */,
                              ),
                              icon: FaIcon(
                                FontAwesomeIcons.magic,
                              ),
                              options: FFButtonOptions(
                                width: 195.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primaryText,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Product Sans',
                                      color: Colors.white,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x320F1113),
                        offset: Offset(0.0, -2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 34.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(null),
                              options: [
                                FFLocalizations.of(context).getText(
                                  'sn7g6tvp' /* Small */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'al4zkr1y' /* Medium */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '7t04qri9' /* Large */,
                                )
                              ],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue = val),
                              width: 130.0,
                              height: 50.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'dj4x0w91' /* Select a Size */,
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color(0xFF95A1AC),
                                size: 15.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderWidth: 2.0,
                              borderRadius: 12.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 4.0, 8.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            '5t8az0g0' /* Add to Cart */,
                          ),
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Product Sans',
                                  color: Colors.white,
                                  useGoogleFonts: false,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ],
          ),
          if (!(isWeb
              ? MediaQuery.viewInsetsOf(context).bottom > 0
              : _isKeyboardVisible))
            Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Container(
                width: double.infinity,
                height: 25.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('PRODUCT_DETAILS_Icon_e8w58qpd_ON_TAP');
                    logFirebaseEvent('Icon_navigate_back');
                    context.safePop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 150.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('PRODUCT_DETAILS_Icon_c48tyg5i_ON_TAP');
                    logFirebaseEvent('Icon_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: ConfirmLogoutWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Icon(
                    Icons.logout_outlined,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
