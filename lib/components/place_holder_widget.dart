import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'place_holder_model.dart';
export 'place_holder_model.dart';

class PlaceHolderWidget extends StatefulWidget {
  const PlaceHolderWidget({Key? key}) : super(key: key);

  @override
  _PlaceHolderWidgetState createState() => _PlaceHolderWidgetState();
}

class _PlaceHolderWidgetState extends State<PlaceHolderWidget> {
  late PlaceHolderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceHolderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.00, 0.00),
        child: Text(
          FFLocalizations.of(context).getText(
            'fx5w5irz' /* Search for product */,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ),
    );
  }
}
