import 'package:bookly_clean_arch/constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final separator = endPoint.contains('?') ? '&' : '?';
    final url = '$_baseUrl$endPoint${separator}key=$kApiKey';
    var response = await _dio.get(url);
    return response.data;
  }
}
