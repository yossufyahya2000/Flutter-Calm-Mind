import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/bot_message_component_widget.dart';
import '/components/user_message_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import 'chatpage_widget.dart' show ChatpageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatpageModel extends FlutterFlowModel<ChatpageWidget> {
  ///  Local state fields for this page.

  bool isFirst = true;

  ///  State fields for stateful widgets in this page.

  // Models for userMessageComponent dynamic component.
  late FlutterFlowDynamicModels<UserMessageComponentModel>
      userMessageComponentModels;
  // State field(s) for mesageTextField widget.
  FocusNode? mesageTextFieldFocusNode;
  TextEditingController? mesageTextFieldTextController;
  String? Function(BuildContext, String?)?
      mesageTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (chatCall)] action in IconButton widget.
  ApiCallResponse? apiResultydt;
  // Stores action output result for [Backend Call - API (newChatCall )] action in IconButton widget.
  ApiCallResponse? chatResponse;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    userMessageComponentModels =
        FlutterFlowDynamicModels(() => UserMessageComponentModel());
  }

  @override
  void dispose() {
    userMessageComponentModels.dispose();
    mesageTextFieldFocusNode?.dispose();
    mesageTextFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
