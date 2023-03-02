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
        response = await http.put(
          uri,
          body: body,
        );
        break;
      case Method.delete:
        response = await http.delete(
          uri,
          body: body,
        );
        break;
      default:
        response = await http.post(
          uri,
          body: body,
        );
        break;
    }
    final json = jsonDecode(response.body);

    if (json['status'] == "ok") {
      final data = json['articles'];
      return data;
    } else {
      throw Exception("Có lỗi xảy ra: $json['message']");
    }
  }
}

final apiService = APIService();

enum Method { get, post, put, delete }
