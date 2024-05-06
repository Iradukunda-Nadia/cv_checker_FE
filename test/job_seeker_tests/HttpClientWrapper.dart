import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClientWrapper {
  final http.Client client;

  HttpClientWrapper(this.client);

  Future<http.Response> post(String url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return client.post(Uri.parse(url), headers: headers, body: body, encoding: encoding);
  }
}