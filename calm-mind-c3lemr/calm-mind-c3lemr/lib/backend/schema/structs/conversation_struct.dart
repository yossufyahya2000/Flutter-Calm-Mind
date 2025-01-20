// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationStruct extends BaseStruct {
  ConversationStruct({
    String? lastMessage,
    String? title,
    String? conversationId,
  })  : _lastMessage = lastMessage,
        _title = title,
        _conversationId = conversationId;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  set lastMessage(String? val) => _lastMessage = val;

  bool hasLastMessage() => _lastMessage != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "conversationId" field.
  String? _conversationId;
  String get conversationId => _conversationId ?? '';
  set conversationId(String? val) => _conversationId = val;

  bool hasConversationId() => _conversationId != null;

  static ConversationStruct fromMap(Map<String, dynamic> data) =>
      ConversationStruct(
        lastMessage: data['lastMessage'] as String?,
        title: data['title'] as String?,
        conversationId: data['conversationId'] as String?,
      );

  static ConversationStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lastMessage': _lastMessage,
        'title': _title,
        'conversationId': _conversationId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lastMessage': serializeParam(
          _lastMessage,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'conversationId': serializeParam(
          _conversationId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConversationStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConversationStruct(
        lastMessage: deserializeParam(
          data['lastMessage'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        conversationId: deserializeParam(
          data['conversationId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConversationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConversationStruct &&
        lastMessage == other.lastMessage &&
        title == other.title &&
        conversationId == other.conversationId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([lastMessage, title, conversationId]);
}

ConversationStruct createConversationStruct({
  String? lastMessage,
  String? title,
  String? conversationId,
}) =>
    ConversationStruct(
      lastMessage: lastMessage,
      title: title,
      conversationId: conversationId,
    );
