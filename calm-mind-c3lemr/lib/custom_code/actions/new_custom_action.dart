// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart';
import '/flutter_flow/custom_functions.dart';

Future<List<MessageStruct>?> newCustomAction(
    List<MessagesRow>? supabaseMessages) async {
  if (supabaseMessages == null) {
    return null;
  }

  return supabaseMessages
      .map((message) => MessageStruct(
            content: message.content,
            role: deserializeEnum<Role>(message.role),
          ))
      .toList();
}
