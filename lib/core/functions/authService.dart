
import 'package:delivery_app/linkapi.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<Map<String, dynamic>> login({required String email, required String password}) async {
    try {
      // Make a POST request to the login endpoint with email and password
      final response = await dio.post(AppLink.login, data: {
        'email': email,
        'password': password,
      });

      // Return the response data
      return response.data;
    } catch (e) {
      // If an error occurs, throw it
      throw e;
    }
  }
}
