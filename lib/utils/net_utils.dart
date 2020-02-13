///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-13 17:31
///
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class NetUtils {
  const NetUtils._();

  static Future<http.Response> fetch(
    FetchType fetchType, {
    @required Uri uri,
    Map<String, String> queryParameters,
    dynamic body,
    Map<String, String> headers,
  }) async {
    if (fetchType != FetchType.get && queryParameters != null) {
      debugPrint('queryParameters only effect when fetch type is `FetchType.get`.');
    }
    http.Response response;
    switch (fetchType) {
      case FetchType.get:
        response = await http.get(uri, headers: headers);
        break;
      case FetchType.post:
        response = await http.post(uri, body: body, headers: headers);
        break;
    }
    return response;
  }
}

enum FetchType { get, post }
