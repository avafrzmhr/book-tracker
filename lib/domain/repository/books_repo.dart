import 'package:dio/dio.dart';

abstract class BooksRepository {
  Future<Response> search(String search);
}
