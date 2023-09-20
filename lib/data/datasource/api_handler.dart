import 'package:book_tracker/peresentation/prefs.dart';
import 'package:dio/dio.dart';

class ApiHandler {
  Dio dio = Dio();

  Future<Response> register(
      String username, String password1, String password2) async {
    Response response = await dio.post(
      'http://127.0.0.1:8000/register/',
      data: {
        'username': username,
        'password1': password1,
        'password2': password2,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              'iMlr9pzvOb31jJ1qloDvYXsNivSCI00GqLAR4FG78H2HgEjTKi6Rt5iXBW0dMfQS',
        },
      ),
    );
    return response;
  }

  Future<Response> login(String username, String password) async {
    Response response = await dio.post(
      'http://127.0.0.1:8000/login/',
      data: {
        'username': username,
        'password': password,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              'iMlr9pzvOb31jJ1qloDvYXsNivSCI00GqLAR4FG78H2HgEjTKi6Rt5iXBW0dMfQS',
        },
      ),
    );
    return response;
  }

  Future<Response> search(String search) async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/books/search/$search',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              'iMlr9pzvOb31jJ1qloDvYXsNivSCI00GqLAR4FG78H2HgEjTKi6Rt5iXBW0dMfQS',
          'Authorization': 'Bearer ${TokenProvider.prefs.getString('access')}',
        },
      ),
    );
    return response;
  }

  
}
