import 'package:dio/dio.dart';

class APIService {
  final Dio _dio;

  APIService(this._dio);

  Future<Response> get(String path) {
    return _dio.get(path);
  }

  Future<Response> post(String path, Map<String, dynamic> body) {
    return _dio.post(path, data: body);
  }
}
