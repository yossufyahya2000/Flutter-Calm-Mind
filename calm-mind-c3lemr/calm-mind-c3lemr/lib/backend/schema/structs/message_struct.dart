// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageStruct extends BaseStruct {
  MessageStruct({
    String? content,
    Role? role,
  })  : _content = content,
        _role = role;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "role" field.
  Role? _role;
  Role? get role => _role;
  set role(Role? val) => _role = val;

  bool hasRole() => _role != null;

  static MessageStruct fromMap(Map<String, dynamic> data) => MessageStruct(
        content: data['content'] as String?,
        role: data['role'] is Role
            ? data['role']
            : deserializeEnum<Role>(data['role']),
      );

  static MessageStruct? maybeFromMap(dynamic data) =>
      data is Map ? MessageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'content': _content,
        'role': _role?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static MessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageStruct(
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        role: deserializeParam<Role>(
          data['role'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'MessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageStruct &&
        content == other.content &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([content, role]);
}

MessageStruct createMessageStruct({
  String? content,
  Role? role,
}) =>
    MessageStruct(
      content: content,
      role: role,
    );
