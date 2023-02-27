import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_app/common/const.dart';

class APIService {
  static final _service = APIService._internal();

  factory APIService() => _service;


  APIService._internal();

  Future request({
    Method method = Method.get,
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse(baseUrl + path + apiKey);
    http.Response response;

      switch (method) {
        case Method.get:
          response = await http.get(
            uri,
          );
          break;
        case Method.put:
          response = await http.put(uri, body: body, encoding: utf8);
          break;
        case Method.delete:
          response = await http.delete(uri, body: body, encoding: utf8);
          break;
        default:
          response = await http.post(uri, body: body, encoding: utf8);
          break;
      }


    final responseJson = json.decode(utf8.decode(response.bodyBytes));

    return responseJson;
  }
}

final apiService = APIService();

enum Method { get, post, put, delete }