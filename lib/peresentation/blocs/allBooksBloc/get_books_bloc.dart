import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:book_tracker/data/repositories/books_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/book.dart';
import 'get_books_event.dart';
import 'get_books_state.dart';

class GetBooksBloc extends Bloc<GetBooksEvent, GetBooksState> {
  BooksRepositoryImp booksRepositoryImp;
  GetBooksBloc(this.booksRepositoryImp) : super(GetBooksInitial()) {
    on<SubmitGetBooksEvent>((event, emit) async {
      var response = await booksRepositoryImp.getAllBooks();
      print(response);
      if (response.statusCode == 200) {
        var book = booksFromJson(jsonEncode(response.data['data']));

        emit(GetBooksSuccess(book));
      } else {
        emit(GetBooksErrorState('error in load books'));
      }
    });
  }
}
