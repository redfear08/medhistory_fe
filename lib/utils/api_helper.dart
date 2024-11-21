import 'package:dio/dio.dart';

class ApiHelper {
  final Dio _dio = Dio();

  static const String baseUrl = "https://your-backend-url.com";

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post("$baseUrl$endpoint", data: data);
      return response;
    } catch (e) {
      throw Exception("Failed to post data: $e");
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get("$baseUrl$endpoint");
      return response;
    } catch (e) {
      throw Exception("Failed to get data: $e");
    }
  }
}
