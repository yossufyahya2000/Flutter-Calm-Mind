// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart';

Future<List<ConversationStruct>?> supaRowToConversations(
    List<ConversationsRow>? supaConv) async {
  if (supaConv == null) {
    return null;
  }

  return supaConv
      .map((conversation) => ConversationStruct(
            title: conversation.title,
            conversationId: conversation.id,
            lastMessage: conversation.title,
          ))
      .toList();
}
