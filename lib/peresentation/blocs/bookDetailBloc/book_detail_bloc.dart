import 'dart:convert';

import 'package:bloc/bloc.dart';

import '../../../data/model/book.dart';
import '../../../data/repositories/books_repo.dart';
import 'book_detail_event.dart';
import 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookEvent, BookDetailState> {
  BooksRepositoryImp booksRepositoryImp;
  BookDetailBloc(this.booksRepositoryImp) : super(BookDetailInitial()) {
    on<SubmitBookEvent>((event, emit) async {
      var response = await booksRepositoryImp.bookDetail(event.id);
      if (response.statusCode == 200) {
        var book = Books.fromJson(response.data['data']);

        emit(BookDetailSuccess(book));
      } else {
        emit(BookDetailErrorState('error in load book detail'));
      }
    });
  }
}
