import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LogInRequestCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'LogInRequest',
      apiUrl:
          'https://2270-154-183-236-52.ngrok-free.app/v1/LoginAction/LogInRequest',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'LogIn': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic logInStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class LoginDataCall {
  static Future<ApiCallResponse> call({
    String? password = 'non',
    String? username = 'non',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'LoginData',
      apiUrl:
          'https://2270-154-183-236-52.ngrok-free.app/v1/loginData/UserDataFromApp',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'password': password,
        'username': username,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTagsDataCall {
  static Future<ApiCallResponse> call({
    List<String>? tagsListList,
  }) async {
    final tagsList = _serializeList(tagsListList);

    final ffApiRequestBody = '''
{
  "TagList": $tagsList
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetTagsData',
      apiUrl:
          'https://2270-154-183-236-52.ngrok-free.app/v1/GetTagsData/GetTagsData',
      callType: ApiCallType.POST,
      headers: {},
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

  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.TagsList''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? duplicates(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Duplicates''',
      ));
}

class SendTagsListCall {
  static Future<ApiCallResponse> call({
    List<String>? tagsListList,
  }) async {
    final tagsList = _serializeList(tagsListList);

    final ffApiRequestBody = '''
{
  "TagList": $tagsList
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendTagsList',
      apiUrl:
          'https://2270-154-183-236-52.ngrok-free.app/v1/StoreTagsInGlobal/StoreTagsInGlobal',
      callType: ApiCallType.POST,
      headers: {},
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
