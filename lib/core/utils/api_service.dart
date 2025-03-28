import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final String endPoint;
  final Dio _dio;

  ApiService({
    required this.endPoint,
    required Dio dio,
  }) : _dio = dio;

  Future<Map<String, dynamic>> get() async {
    Response response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
