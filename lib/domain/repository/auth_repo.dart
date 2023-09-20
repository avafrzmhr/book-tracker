import 'package:dio/dio.dart';

abstract class AuthRepository {
  Future<Response> register(
      String username, String password1, String password2);
  Future<Response> login(String username, String password);
}
