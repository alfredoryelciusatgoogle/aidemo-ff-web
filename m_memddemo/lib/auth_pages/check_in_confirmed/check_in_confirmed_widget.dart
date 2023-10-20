import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'check_in_confirmed_model.dart';
export 'check_in_confirmed_model.dart';

class CheckInConfirmedWidget extends StatefulWidget {
  const CheckInConfirmedWidget({Key? key}) : super(key: key);

  @override
  _CheckInConfirmedWidgetState createState() => _CheckInConfirmedWidgetState();
}

class _CheckInConfirmedWidgetState extends State<CheckInConfirmedWidget> {
  late CheckInConfirmedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckInConfirmedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CheckInConfirmed'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHECK_IN_CONFIRMED_CheckInConfirmed_ON_I');
      logFirebaseEvent('CheckInConfirmed_backend_call');

      await TokensRecord.collection.doc().set(createTokensRecordData(
            tokenId: 'DESCRIPTIONBOT',
            token: 'init',
            userId: currentUserReference,
          ));
      logFirebaseEvent('CheckInConfirmed_wait__delay');
      await Future.delayed(const Duration(milliseconds: 10000));
      logFirebaseEvent('CheckInConfirmed_navigate_to');

      context.goNamed(
        'Home',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
          ),
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Lottie.asset(
                    'assets/lottie_animations/0E76udZTtb.json',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                    repeat: false,
                    animate: true,
                  ),
                ),
                Container(
                  width: 400.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'uo5wt6fm' /* You've checked in! */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Product Sans',
                                  color: Colors.white,
                                  useGoogleFonts: false,
                                ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 48.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CHECK_IN_CONFIRMED_CONTINUE_BTN_ON_TAP');
                            logFirebaseEvent('Button_backend_call');

                            await TokensRecord.collection
                                .doc()
                                .set(createTokensRecordData(
                                  tokenId: 'DESCRIPTIONBOT',
                                  token: 'init',
                                  userId: currentUserReference,
                                ));
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed(
                              'Home',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            '373ui5bm' /* Continue */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Product Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
