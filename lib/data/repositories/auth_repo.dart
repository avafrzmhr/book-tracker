import 'package:dio/dio.dart';

import '../../domain/repository/auth_repo.dart';
import '../datasource/api_handler.dart';

class AuthRepositoryImp extends AuthRepository {
  final ApiHandler apiHandler;
  AuthRepositoryImp(this.apiHandler);

  @override
  Future<Response> register(
      String username, String password1, String password2) async {
    var registerResponse =
        await apiHandler.register(username, password1, password2);
    return registerResponse;
  }

  @override
  Future<Response> login(String username, String password) async {
    var loginResponse = await apiHandler.login(username, password);
    return loginResponse;
  }
}
