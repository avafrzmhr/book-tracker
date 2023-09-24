import 'package:dio/dio.dart';

abstract class BooksRepository {
  Future<Response> getAllBooks();
  Future<Response> search(String search);
  Future<Response> bookDetail(int id);
  Future<Response> read();
  Future<Response> addRead(List<int> id);
  Future<Response> currentlyReading();
  Future<Response> addCurrentlyReading(List<int> id);
  Future<Response> wantToRead();
  Future<Response> addWantToRead(List<int> id);
}
