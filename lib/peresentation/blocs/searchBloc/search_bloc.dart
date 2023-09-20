import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:book_tracker/data/model/book.dart';
import 'package:book_tracker/data/repositories/books_repo.dart';
import 'package:equatable/equatable.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  BooksRepositoryImp booksRepositoryImp;
  SearchBloc(this.booksRepositoryImp) : super(SearchInitial()) {
    on<SubmitSearchEvent>((event, emit) async {
      var response = await booksRepositoryImp.search(event.searchKey);
      if (response.statusCode == 200) {
        print(response.data);
        var books = booksFromJson(jsonEncode(response.data));
        print(books);
        emit(SearchSuccess(books));
      } else {
        emit(SearchErrorState('error in search'));
      }
    });
  }
}
