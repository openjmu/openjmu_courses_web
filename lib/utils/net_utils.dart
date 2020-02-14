///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-13 17:31
///
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetUtils {
  const NetUtils._();

  static Future<http.Response> fetch(
    FetchType fetchType, {
    @required Uri uri,
    dynamic body,
    Map<String, String> headers,
  }) async {
    http.Response response;
    switch (fetchType) {
      case FetchType.get:
        response = await http.get(uri, headers: headers);
        break;
      case FetchType.post:
        response = await http.post(uri, body: jsonEncode(body), headers: headers);
        break;
    }
    return response;
  }
}

enum FetchType { get, post }
