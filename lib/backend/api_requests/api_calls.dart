import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LogInRequestCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "$username",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LogInRequest',
      apiUrl: 'http://192.168.8.105:8001/V1/LogInRequest',
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

  static bool? logInStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.status''',
      ));
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
      apiUrl: 'http://192.168.8.105:8001/V1/GetTagsData',
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

  static List<String>? epc(dynamic response) => (getJsonField(
        response,
        r'''$[:].EPC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? barcode(dynamic response) => (getJsonField(
        response,
        r'''$[:].Barcode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      apiUrl: 'http://192.168.8.105:8001/V1/StoreTagsInGlobal',
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

class PingCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Ping',
      apiUrl: 'http://192.168.8.105:8001/V1/Ping',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Response''',
      ));
}

class GetBarcodeDataCall {
  static Future<ApiCallResponse> call({
    String? barcode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Barcode": "$barcode"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetBarcodeData',
      apiUrl: 'http://192.168.8.105:8001/V1/GetBarcodeData',
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

  static String? iPCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.IPCode''',
      ));
  static String? data(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
  static String? epc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.EPC''',
      ));
  static bool? presented(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.Status''',
      ));
}

class GetEPCCall {
  static Future<ApiCallResponse> call({
    String? barcode = '--',
  }) async {
    final ffApiRequestBody = '''
{
  "Barcode": "$barcode"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetEPC',
      apiUrl: 'http://192.168.8.105:8001/V1/GetEPC',
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

  static String? epc(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.EPC''',
      ));
}

class VerifyEPCInsertionCall {
  static Future<ApiCallResponse> call({
    String? readEPC = '',
    String? writtenEPC = '',
    String? iPCode = '',
    String? machineCode = '',
    String? barcode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "ReadEPC": "$readEPC",
  "WrittenEPC": "$writtenEPC",
  "IPCode": "$iPCode",
  "MachineCode": "$machineCode",
  "Barcode": "$barcode"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VerifyEPCInsertion',
      apiUrl: 'http://192.168.8.105:8001/V1/VerifyEPCInsertion',
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

  static bool? response(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.Response''',
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
