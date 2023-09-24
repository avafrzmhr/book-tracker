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

  @override
  Future<Response> read() async {
    var response = await apiHandler.read();
    return response;
  }
  
  @override
  Future<Response> currentlyReading() async{
    var response = await apiHandler.currentlyRead();
    return response;
  }
  
  @override
  Future<Response> wantToRead() async{
   var response = await apiHandler.wantToRead();
    return response;
  }
  
  @override
  Future<Response> addCurrentlyReading(List<int> id) async{
     var response = await apiHandler.addCurrentlyReading(id);
    return response;
  }
  
  @override
  Future<Response> addRead(List<int> id) async{
   var response = await apiHandler.addRead(id);
    return response;
  }
  
  @override
  Future<Response> addWantToRead(List<int> id) async{
    var response = await apiHandler.addWantToRead(id);
    return response;
  }
  
  @override
  Future<Response> getAllBooks() async{
     var response = await apiHandler.getAllBooks();
    return response;
  }
}
