import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({Dio? dioOverride}) : dio = dioOverride ?? Dio(
    BaseOptions(
      baseUrl: 'https://opentdb.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  ) {
    this.dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Erreur de connexion serveur');
    } catch (e) {
      throw ServerException(message: 'Erreur inattendue : $e');
    }
  }
}

class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
  
  @override
  String toString() => message;
}
