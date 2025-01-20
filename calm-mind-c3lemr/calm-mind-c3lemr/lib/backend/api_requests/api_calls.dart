import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreatePredictionCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
    double? promptStrength = 0.8,
    int? inferenceSteps = 10,
    double? guidanceScale = 7.5,
  }) async {
    final ffApiRequestBody = '''
{
  "version": "27b93a2413e7f36cd83da926f3656280b2931564ff050bf9575f1fdf9bcd7478",
  "input": {
    "prompt": "${prompt}",
    "width": 512,
    "height": 512,
    "prompt_strength": ${promptStrength},
    "num_inference_steps": ${inferenceSteps},
    "guidance_scale": ${guidanceScale},
    "scheduler": "K-LMS"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Prediction',
      apiUrl: 'https://api.replicate.com/v1/predictions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Token API_KEY_HERE',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic getUrl(dynamic response) => getJsonField(
        response,
        r'''$.urls.get''',
      );
  static dynamic version(dynamic response) => getJsonField(
        response,
        r'''$.version''',
      );
  static dynamic cancelUrl(dynamic response) => getJsonField(
        response,
        r'''$.urls.cancel''',
      );
}

class GetPredictionCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Prediction',
      apiUrl: 'https://api.replicate.com/v1/predictions/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Token API_KEY_HERE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic completedAt(dynamic response) => getJsonField(
        response,
        r'''$.completed_at''',
      );
  static dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic prompt(dynamic response) => getJsonField(
        response,
        r'''$.input.prompt''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static List? outputImage(dynamic response) => getJsonField(
        response,
        r'''$.output''',
        true,
      ) as List?;
  static dynamic version(dynamic response) => getJsonField(
        response,
        r'''$.version''',
      );
  static dynamic logs(dynamic response) => getJsonField(
        response,
        r'''$.logs''',
      );
}

class CancelPredictionCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final ffApiRequestBody = '''
{ }''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cancel Prediction',
      apiUrl: 'https://api.replicate.com/v1/predictions/${id}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Token API_KEY_HERE',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class ChatCallCall {
  static Future<ApiCallResponse> call({
    String? profileId = 'a69b5be5-9f31-488a-a594-e3a8de6a6253',
    String? content = '',
    String? conversationId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "profile_id": "${escapeStringForJson(profileId)}",
  "content": "${escapeStringForJson(content)}",
  "conversation_id": "${escapeStringForJson(conversationId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'chatCall',
      apiUrl: 'https://aichatbot-ten-henna.vercel.app/chat',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.text''',
      ));
}

class NewChatCallCall {
  static Future<ApiCallResponse> call({
    String? profileId = 'a69b5be5-9f31-488a-a594-e3a8de6a6253',
    String? content = '',
  }) async {
    final ffApiRequestBody = '''
{
  "profile_id": "${escapeStringForJson(profileId)}",
  "content": "${escapeStringForJson(content)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'newChatCall ',
      apiUrl: 'https://aichatbot-ten-henna.vercel.app/chat',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }

  static String? conversationId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.conversation_id''',
      ));
  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.text''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
