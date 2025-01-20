import '/backend/api_requests/api_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future downloadAndStoreConversation(BuildContext context) async {
  List<MessagesRow>? conversationMessages;
  List<MessageStruct>? listOfMessages;

  conversationMessages = await MessagesTable().queryRows(
    queryFn: (q) => q
        .eqOrNull(
          'conversation_id',
          FFAppState().actioveConversasionId,
        )
        .order('created_at'),
  );
  listOfMessages = await actions.newCustomAction(
    conversationMessages?.toList(),
  );
  FFAppState().conversation = listOfMessages!.toList().cast<MessageStruct>();
  FFAppState().update(() {});
}

Future<List<ConversationStruct>?> downloadConversationList(
    BuildContext context) async {
  List<ConversationsRow>? conversationsRows;
  List<ConversationStruct>? conversationList;

  conversationsRows = await ConversationsTable().queryRows(
    queryFn: (q) => q.order('updated_at'),
  );
  conversationList = await actions.supaRowToConversations(
    conversationsRows?.toList(),
  );
  FFAppState().conversationsList =
      conversationList!.toList().cast<ConversationStruct>();

  return null;
}
