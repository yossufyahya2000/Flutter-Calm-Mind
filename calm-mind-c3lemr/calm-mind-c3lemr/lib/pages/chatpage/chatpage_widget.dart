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
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chatpage_model.dart';
export 'chatpage_model.dart';

class ChatpageWidget extends StatefulWidget {
  const ChatpageWidget({super.key});

  @override
  State<ChatpageWidget> createState() => _ChatpageWidgetState();
}

class _ChatpageWidgetState extends State<ChatpageWidget> {
  late ChatpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatpageModel());

    _model.mesageTextFieldTextController ??= TextEditingController();
    _model.mesageTextFieldFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 1.0,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'l5mftf4n' /* Online */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('ProfilePage');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            child: Builder(
                              builder: (context) {
                                final conversationvar =
                                    FFAppState().conversation.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  reverse: true,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: conversationvar.length,
                                  itemBuilder: (context, conversationvarIndex) {
                                    final conversationvarItem =
                                        conversationvar[conversationvarIndex];
                                    return Builder(
                                      builder: (context) {
                                        if (conversationvarItem.role ==
                                            Role.user) {
                                          return wrapWithModel(
                                            model: _model
                                                .userMessageComponentModels
                                                .getModel(
                                              conversationvarIndex.toString(),
                                              conversationvarIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: UserMessageComponentWidget(
                                              key: Key(
                                                'Keycw0_${conversationvarIndex.toString()}',
                                              ),
                                              content:
                                                  conversationvarItem.content,
                                            ),
                                          );
                                        } else {
                                          return BotMessageComponentWidget(
                                            key: Key(
                                                'Keyldq_${conversationvarIndex}_of_${conversationvar.length}'),
                                            content:
                                                conversationvarItem.content,
                                          );
                                        }
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _model.mesageTextFieldTextController,
                                  focusNode: _model.mesageTextFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'h4xgaojs' /* Type your message... */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        letterSpacing: 0.0,
                                      ),
                                  minLines: 1,
                                  validator: _model
                                      .mesageTextFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 25.0,
                                  buttonSize: 50.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).mycolor,
                                  icon: Icon(
                                    Icons.send_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    FFAppState().insertAtIndexInConversation(
                                        0,
                                        MessageStruct(
                                          content: _model
                                              .mesageTextFieldTextController
                                              .text,
                                          role: Role.user,
                                        ));
                                    safeSetState(() {});
                                    safeSetState(() {
                                      _model.mesageTextFieldTextController
                                          ?.clear();
                                    });
                                    if (FFAppState().actioveConversasionId !=
                                            null &&
                                        FFAppState().actioveConversasionId !=
                                            '') {
                                      _model.apiResultydt =
                                          await ChatCallCall.call(
                                        content: FFAppState()
                                            .conversation
                                            .firstOrNull
                                            ?.content,
                                        conversationId:
                                            FFAppState().actioveConversasionId,
                                      );
                                      if (_model.apiResultydt?.succeeded ??
                                          true) {
                                        _model.apiResultydt?.streamedResponse
                                            ?.stream
                                            .transform(utf8.decoder)
                                            .transform(const LineSplitter())
                                            .transform(
                                                ServerSentEventLineTransformer())
                                            .map((m) => ResponseStreamMessage(
                                                message: m))
                                            .listen(
                                              (onMessageInput) async {
                                                if (_model.isFirst == true) {
                                                  FFAppState()
                                                      .insertAtIndexInConversation(
                                                          0,
                                                          MessageStruct(
                                                            content:
                                                                ChatCallCall
                                                                    .response(
                                                              onMessageInput
                                                                  .serverSentEvent
                                                                  .jsonData,
                                                            ),
                                                            role:
                                                                Role.assistant,
                                                          ));
                                                  FFAppState().update(() {});
                                                  _model.isFirst = false;
                                                } else {
                                                  FFAppState()
                                                      .updateConversationAtIndex(
                                                    0,
                                                    (e) => e
                                                      ..content =
                                                          '${FFAppState().conversation.firstOrNull?.content}${ChatCallCall.response(
                                                        onMessageInput
                                                            .serverSentEvent
                                                            .jsonData,
                                                      )}',
                                                  );
                                                  FFAppState().update(() {});
                                                }
                                              },
                                              onError: (onErrorInput) async {},
                                              onDone: () async {
                                                _model.isFirst = true;
                                              },
                                            );
                                      }

                                      if ((_model.apiResultydt?.succeeded ??
                                          true)) {
                                        FFAppState().update(() {});
                                      }
                                    } else {
                                      _model.chatResponse =
                                          await NewChatCallCall.call(
                                        content: FFAppState()
                                            .conversation
                                            .firstOrNull
                                            ?.content,
                                      );
                                      if (_model.chatResponse?.succeeded ??
                                          true) {
                                        _model.chatResponse?.streamedResponse
                                            ?.stream
                                            .transform(utf8.decoder)
                                            .transform(const LineSplitter())
                                            .transform(
                                                ServerSentEventLineTransformer())
                                            .map((m) => ResponseStreamMessage(
                                                message: m))
                                            .listen(
                                              (onMessageInput) async {
                                                if (_model.isFirst == true) {
                                                  FFAppState()
                                                      .insertAtIndexInConversation(
                                                          0,
                                                          MessageStruct(
                                                            content:
                                                                NewChatCallCall
                                                                    .response(
                                                              onMessageInput
                                                                  .serverSentEvent
                                                                  .jsonData,
                                                            ),
                                                            role:
                                                                Role.assistant,
                                                          ));
                                                  FFAppState()
                                                          .actioveConversasionId =
                                                      NewChatCallCall
                                                          .conversationId(
                                                    onMessageInput
                                                        .serverSentEvent
                                                        .jsonData,
                                                  )!;
                                                  FFAppState().update(() {});
                                                  _model.isFirst = false;
                                                } else {
                                                  FFAppState()
                                                      .updateConversationAtIndex(
                                                    0,
                                                    (e) => e
                                                      ..content =
                                                          '${FFAppState().conversation.firstOrNull?.content}${NewChatCallCall.response(
                                                        onMessageInput
                                                            .serverSentEvent
                                                            .jsonData,
                                                      )}',
                                                  );
                                                  FFAppState().update(() {});
                                                }
                                              },
                                              onError: (onErrorInput) async {},
                                              onDone: () async {
                                                _model.isFirst = true;
                                              },
                                            );
                                      }

                                      if ((_model.chatResponse?.succeeded ??
                                          true)) {
                                        FFAppState().actioveConversasionId =
                                            NewChatCallCall.conversationId(
                                          (_model.chatResponse?.jsonBody ?? ''),
                                        )!;

                                        FFAppState().update(() {});
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (false)
                Material(
                  color: Colors.transparent,
                  elevation: 2.0,
                  child: Container(
                    width: 300.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'rybwdbjg' /* Conversations */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: FFLocalizations.of(context).getText(
                                '5f19er2a' /* Search conversations... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              suffixIcon: Icon(
                                Icons.search,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  letterSpacing: 0.0,
                                ),
                            minLines: 1,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                          ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2eqzu17i' /* AI */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'v7i08ykf' /* Travel Planning */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'eolxwkgi' /* Let's plan your next vacation! */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3pg11uzv' /* AI */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'h571d4e2' /* Fitness Coach */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '8drk3qmy' /* Your personalized workout plan */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nwtkg015' /* AI */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'uugl353x' /* Recipe Assistant */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nhjz1y77' /* Cooking made easy! */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
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
