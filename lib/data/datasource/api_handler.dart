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
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
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
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
        },
      ),
    );
    return response;
  }

  Future<Response> getAllBooks() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/books/',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
          'Authorization': 'Bearer ${TokenProvider.prefs.getString('access')}',
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
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
          'Authorization': 'Bearer ${TokenProvider.prefs.getString('access')}',
        },
      ),
    );
    return response;
  }

  Future<Response> bookDetail(int id) async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/books/$id',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
          'Authorization': 'Bearer ${TokenProvider.prefs.getString('access')}',
        },
      ),
    );
    return response;
  }

  Future<Response> read() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/books/Read',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
          'Authorization': 'Bearer ${TokenProvider.prefs.getString('access')}',
        },
      ),
    );
    return response;
  }

  Future<Response> currentlyRead() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/books/CurrentlyReading',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
          'Authorization': 'Bearer ${TokenProvider.prefs.getString('access')}',
        },
      ),
    );
    return response;
  }

  Future<Response> wantToRead() async {
    Response response = await dio.get(
      'http://127.0.0.1:8000/books/wantsToRead',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
          'Authorization': 'Bearer ${TokenProvider.prefs.getString('access')}',
        },
      ),
    );
    return response;
  }

  Future<Response> addRead(List<int> id) async {
    Response response = await dio.post(
      'http://127.0.0.1:8000/books/Read/create/',
      data: {
        'books': id,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
          'Authorization': 'Bearer ${TokenProvider.prefs.getString('access')}',
        },
      ),
    );
    return response;
  }

  Future<Response> addWantToRead(List<int> id) async {
    Response response = await dio.post(
      'http://127.0.0.1:8000/books/wantsToRead/create/',
      data: {
        'books': id,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
          'Authorization': 'Bearer ${TokenProvider.prefs.getString('access')}',
        },
      ),
    );
    return response;
  }

  Future<Response> addCurrentlyReading(List<int> id) async {
    Response response = await dio.post(
      'http://127.0.0.1:8000/books/CurrentlyReading/create/',
      data: {
        'books': id,
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'X-CSRFToken':
              ' 1NwqWxJrPplawR1FWFzAdMbhPZBuL84U0kQjCEE4wpPgRMPTpPcEmgpjhmQvWXGM',
          'Authorization': 'Bearer ${TokenProvider.prefs.getString('access')}',
        },
      ),
    );
    return response;
  }
}
