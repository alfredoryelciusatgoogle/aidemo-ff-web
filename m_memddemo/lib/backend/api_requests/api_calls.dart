import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class NicknameGeneratorCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'NicknameGenerator',
      apiUrl: 'https://nicknames-api-m6fsllbd2a-as.a.run.app/nickname',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nickname(dynamic response) => getJsonField(
        response,
        r'''$.nickname''',
      );
}

class FetchItemsCall {
  static Future<ApiCallResponse> call({
    String? searchQuery = 'Stylish Workwear',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "${searchQuery}",
  "numNeighbors": 20
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'fetchItems',
      apiUrl:
          'https://backend-matching-engine-lgw2vs6jea-uc.a.run.app/match-by-text/text_to_image_multimodal',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic distance(dynamic response) => getJsonField(
        response,
        r'''$.results[:].distance''',
        true,
      );
  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.results[:].description''',
        true,
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.results[:].url''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.results[:].image''',
        true,
      );
}

class FetchItemsImageSearchCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? imageData,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'fetchItems Image Search',
      apiUrl:
          'https://backend-matching-engine-lgw2vs6jea-uc.a.run.app/match-by-image/image_to_image_multimodal',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': imageData,
        'numNeighbours': "20",
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GenerateDescriptionCall {
  static Future<ApiCallResponse> call({
    String? title = 'Mobile Phone',
    String? language = 'en',
    String? descriptionBotToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "title": "${title}",
  "language": "${language}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateDescription',
      apiUrl:
          'https://agile-ridge-02432.herokuapp.com/https://imagedescription-iytuxr6j5a-uc.a.run.app/desc_from_title',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${descriptionBotToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GenerateDescriptionfromImageCall {
  static Future<ApiCallResponse> call({
    String? imageUrl = '',
    String? language = '',
    String? descriptionBotToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "img_url": "${imageUrl}",
  "language": "${language}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateDescriptionfromImage',
      apiUrl:
          'https://agile-ridge-02432.herokuapp.com/https://imagedescription-iytuxr6j5a-uc.a.run.app/desc_from_img',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${descriptionBotToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
