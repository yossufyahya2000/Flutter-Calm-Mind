import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'create_post_page_widget.dart' show CreatePostPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePostPageModel extends FlutterFlowModel<CreatePostPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for mobileDescription widget.
  FocusNode? mobileDescriptionFocusNode;
  TextEditingController? mobileDescriptionTextController;
  String? Function(BuildContext, String?)?
      mobileDescriptionTextControllerValidator;
  // State field(s) for DesktopDescription widget.
  FocusNode? desktopDescriptionFocusNode;
  TextEditingController? desktopDescriptionTextController;
  String? Function(BuildContext, String?)?
      desktopDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    mobileDescriptionFocusNode?.dispose();
    mobileDescriptionTextController?.dispose();

    desktopDescriptionFocusNode?.dispose();
    desktopDescriptionTextController?.dispose();
  }
}
