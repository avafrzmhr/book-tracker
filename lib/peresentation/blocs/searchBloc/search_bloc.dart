import 'dart:convert';
import 'package:bloc/bloc.dart';
import '/data/model/book.dart';
import '/data/repositories/books_repo.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  BooksRepositoryImp booksRepositoryImp;
  SearchBloc(this.booksRepositoryImp) : super(SearchInitial()) {
    on<SubmitSearchEvent>((event, emit) async {
      var response = await booksRepositoryImp.search(event.searchKey);
      if (response.statusCode == 200) {
       
        var books = booksFromJson(jsonEncode(response.data));
        
        emit(SearchSuccess(books));
      } else {
        emit(SearchErrorState('error in search'));
      }
    });
  }
}
