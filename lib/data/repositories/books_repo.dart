import 'package:dio/src/response.dart';

import '../../domain/repository/books_repo.dart';
import '../datasource/api_handler.dart';

class BooksRepositoryImp extends BooksRepository {
  ApiHandler apiHandler;
  BooksRepositoryImp(this.apiHandler);
  @override
  Future<Response> search(String search) async {
    var response = await apiHandler.search(search);
    return response;
  }

  @override
  Future<Response> bookDetail(int id) async {
    var response = await apiHandler.bookDetail(id);
    return response;
  }
}
