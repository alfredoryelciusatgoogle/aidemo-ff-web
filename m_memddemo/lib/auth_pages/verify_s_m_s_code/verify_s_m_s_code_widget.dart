import '/auth/firebase_auth/auth_util.dart';
import '/auth_pages/add_full_name/add_full_name_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_s_m_s_code_model.dart';
export 'verify_s_m_s_code_model.dart';

class VerifySMSCodeWidget extends StatefulWidget {
  const VerifySMSCodeWidget({Key? key}) : super(key: key);

  @override
  _VerifySMSCodeWidgetState createState() => _VerifySMSCodeWidgetState();
}

class _VerifySMSCodeWidgetState extends State<VerifySMSCodeWidget>
    with TickerProviderStateMixin {
  late VerifySMSCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'iconOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 600.ms,
          duration: 1200.ms,
          begin: Offset(0.5, 0.5),
          end: Offset(1.0, 1.0),
        ),
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 1200.ms,
          hz: 2,
          offset: Offset(0.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
    'iconOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1.0, 1.0),
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0.0,
          end: 0.02,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifySMSCodeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VerifySMSCode'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Container(
                  width: 400.0,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 48.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    if (_model.pinCodeController!.text ==
                                            null ||
                                        _model.pinCodeController!.text == '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 24.0),
                                        child: Icon(
                                          Icons.lock_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 80.0,
                                        ).animateOnPageLoad(animationsMap[
                                            'iconOnPageLoadAnimation1']!),
                                      ),
                                    if (_model.pinCodeController!.text !=
                                            null &&
                                        _model.pinCodeController!.text != '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 24.0),
                                        child: Icon(
                                          Icons.lock_open_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 80.0,
                                        ).animateOnPageLoad(animationsMap[
                                            'iconOnPageLoadAnimation2']!),
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 48.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10.0,
                                            color: Color(0x19000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6wvtugmr' /* Verify SMS Code */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'mcjfd8o6' /* Enter the code you recieved to... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 24.0, 0.0, 0.0),
                                              child: PinCodeTextField(
                                                autoDisposeControllers: false,
                                                appContext: context,
                                                length: 6,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Product Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: false,
                                                        ),
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                enableActiveFill: true,
                                                autoFocus: true,
                                                enablePinAutofill: true,
                                                errorTextSpace: 16.0,
                                                showCursor: true,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                obscureText: false,
                                                hintCharacter: '●',
                                                pinTheme: PinTheme(
                                                  fieldHeight: 60.0,
                                                  fieldWidth: 40.0,
                                                  borderWidth: 2.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  shape: PinCodeFieldShape.box,
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  inactiveColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  selectedColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  activeFillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  inactiveFillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  selectedFillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                controller:
                                                    _model.pinCodeController,
                                                onChanged: (_) {},
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                validator: _model
                                                    .pinCodeControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: _model
                                                                .pinCodeController!
                                                                .text ==
                                                            null ||
                                                        _model.pinCodeController!
                                                                .text ==
                                                            ''
                                                    ? null
                                                    : () async {
                                                        logFirebaseEvent(
                                                            'VERIFY_S_M_S_CODE_VERIFY_S_M_S_CODE_BTN_');
                                                        var _shouldSetState =
                                                            false;
                                                        logFirebaseEvent(
                                                            'Button_auth');
                                                        GoRouter.of(context)
                                                            .prepareAuthEvent();
                                                        final smsCodeVal = _model
                                                            .pinCodeController!
                                                            .text;
                                                        if (smsCodeVal ==
                                                                null ||
                                                            smsCodeVal
                                                                .isEmpty) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                  'Enter SMS verification code.'),
                                                            ),
                                                          );
                                                          return;
                                                        }
                                                        final phoneVerifiedUser =
                                                            await authManager
                                                                .verifySmsCode(
                                                          context: context,
                                                          smsCode: smsCodeVal,
                                                        );
                                                        if (phoneVerifiedUser ==
                                                            null) {
                                                          return;
                                                        }

                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        _model.nickname =
                                                            await NicknameGeneratorCall
                                                                .call();
                                                        _shouldSetState = true;
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await currentUserReference!
                                                            .update(
                                                                createUsersRecordData(
                                                          nickname:
                                                              NicknameGeneratorCall
                                                                  .nickname(
                                                            (_model.nickname
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString(),
                                                        ));
                                                        if (currentUserDisplayName !=
                                                                null &&
                                                            currentUserDisplayName !=
                                                                '') {
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          await VisitorsRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createVisitorsRecordData(
                                                                visitorName:
                                                                    currentUserDisplayName,
                                                                checkInTime:
                                                                    getCurrentTimestamp,
                                                                visitorPhone:
                                                                    currentPhoneNumber,
                                                                visitorLocationId:
                                                                    FFAppState()
                                                                        .locationID,
                                                              ));
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.goNamedAuth(
                                                              'CheckInConfirmed',
                                                              context.mounted);

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Color(
                                                                    0x27000000),
                                                            barrierColor: Color(
                                                                0x27000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      AddFullNameWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '2mwjpi8j' /* Verify SMS Code */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Product Sans',
                                                        color: Colors.white,
                                                        useGoogleFonts: false,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  disabledTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                      color: _model.pinCodeController!.text == null ||
                              _model.pinCodeController!.text == ''
                          ? FlutterFlowTheme.of(context).secondaryText
                          : FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
