import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _imageUrl = '';
  String get imageUrl => _imageUrl;
  set imageUrl(String value) {
    _imageUrl = value;
  }

  bool _isLoginSelected = true;
  bool get isLoginSelected => _isLoginSelected;
  set isLoginSelected(bool value) {
    _isLoginSelected = value;
  }

  bool _isGenerating = false;
  bool get isGenerating => _isGenerating;
  set isGenerating(bool value) {
    _isGenerating = value;
  }

  String _statusStarting = 'starting';
  String get statusStarting => _statusStarting;
  set statusStarting(String value) {
    _statusStarting = value;
  }

  String _statusProcessing = 'processing';
  String get statusProcessing => _statusProcessing;
  set statusProcessing(String value) {
    _statusProcessing = value;
  }

  String _statusSucceeded = 'succeeded';
  String get statusSucceeded => _statusSucceeded;
  set statusSucceeded(String value) {
    _statusSucceeded = value;
  }

  String _statusFailed = 'failed';
  String get statusFailed => _statusFailed;
  set statusFailed(String value) {
    _statusFailed = value;
  }

  String _statusCanceled = 'canceled';
  String get statusCanceled => _statusCanceled;
  set statusCanceled(String value) {
    _statusCanceled = value;
  }

  bool _isArtPreviewEnabled = false;
  bool get isArtPreviewEnabled => _isArtPreviewEnabled;
  set isArtPreviewEnabled(bool value) {
    _isArtPreviewEnabled = value;
  }

  bool _isTagUsersExpanded = false;
  bool get isTagUsersExpanded => _isTagUsersExpanded;
  set isTagUsersExpanded(bool value) {
    _isTagUsersExpanded = value;
  }

  List<DocumentReference> _taggedUsers = [];
  List<DocumentReference> get taggedUsers => _taggedUsers;
  set taggedUsers(List<DocumentReference> value) {
    _taggedUsers = value;
  }

  void addToTaggedUsers(DocumentReference value) {
    taggedUsers.add(value);
  }

  void removeFromTaggedUsers(DocumentReference value) {
    taggedUsers.remove(value);
  }

  void removeAtIndexFromTaggedUsers(int index) {
    taggedUsers.removeAt(index);
  }

  void updateTaggedUsersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    taggedUsers[index] = updateFn(_taggedUsers[index]);
  }

  void insertAtIndexInTaggedUsers(int index, DocumentReference value) {
    taggedUsers.insert(index, value);
  }

  String _actioveConversasionId = '';
  String get actioveConversasionId => _actioveConversasionId;
  set actioveConversasionId(String value) {
    _actioveConversasionId = value;
  }

  List<MessageStruct> _conversation = [];
  List<MessageStruct> get conversation => _conversation;
  set conversation(List<MessageStruct> value) {
    _conversation = value;
  }

  void addToConversation(MessageStruct value) {
    conversation.add(value);
  }

  void removeFromConversation(MessageStruct value) {
    conversation.remove(value);
  }

  void removeAtIndexFromConversation(int index) {
    conversation.removeAt(index);
  }

  void updateConversationAtIndex(
    int index,
    MessageStruct Function(MessageStruct) updateFn,
  ) {
    conversation[index] = updateFn(_conversation[index]);
  }

  void insertAtIndexInConversation(int index, MessageStruct value) {
    conversation.insert(index, value);
  }
}
