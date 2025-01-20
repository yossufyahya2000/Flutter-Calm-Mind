import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'wecome_message_model.dart';
export 'wecome_message_model.dart';

class WecomeMessageWidget extends StatefulWidget {
  const WecomeMessageWidget({super.key});

  @override
  State<WecomeMessageWidget> createState() => _WecomeMessageWidgetState();
}

class _WecomeMessageWidgetState extends State<WecomeMessageWidget> {
  late WecomeMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WecomeMessageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              '428l0fdf' /* Open up your */,
            ),
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          GradientText(
            FFLocalizations.of(context).getText(
              'pwb2nohv' /* creative boundries */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 32.0,
                  letterSpacing: 0.0,
                ),
            colors: [
              FlutterFlowTheme.of(context).alternate,
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).secondary
            ],
            gradientDirection: GradientDirection.ltr,
            gradientType: GradientType.linear,
          ),
        ],
      ),
    );
  }
}
