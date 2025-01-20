import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/bot_message_component_widget.dart';
import '/components/user_message_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'chatpage_widget.dart' show ChatpageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatpageModel extends FlutterFlowModel<ChatpageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for messagesList widget.
  ScrollController? messagesList;
  // Models for userMessageComponent dynamic component.
  late FlutterFlowDynamicModels<UserMessageComponentModel>
      userMessageComponentModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (chatCall)] action in IconButton widget.
  ApiCallResponse? apiResultydt;
  // Stores action output result for [Backend Call - API (newChatCall )] action in IconButton widget.
  ApiCallResponse? chatResponse;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for ListView widget.
  ScrollController? listViewController;

  @override
  void initState(BuildContext context) {
    messagesList = ScrollController();
    userMessageComponentModels =
        FlutterFlowDynamicModels(() => UserMessageComponentModel());
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    messagesList?.dispose();
    userMessageComponentModels.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    listViewController?.dispose();
  }
}
