import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_post_header_model.dart';
export 'loading_post_header_model.dart';

class LoadingPostHeaderWidget extends StatefulWidget {
  const LoadingPostHeaderWidget({super.key});

  @override
  State<LoadingPostHeaderWidget> createState() =>
      _LoadingPostHeaderWidgetState();
}

class _LoadingPostHeaderWidgetState extends State<LoadingPostHeaderWidget> {
  late LoadingPostHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingPostHeaderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 36.0,
          height: 36.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).iconColor,
            shape: BoxShape.circle,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
          child: Container(
            width: 60.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).iconColor,
              borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.rectangle,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(),
          ),
        ),
        Icon(
          Icons.bookmark_border,
          color: FlutterFlowTheme.of(context).iconColor,
          size: 26.0,
        ),
      ],
    );
  }
}
