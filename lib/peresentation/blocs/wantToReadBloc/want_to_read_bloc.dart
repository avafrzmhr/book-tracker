import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:book_tracker/data/repositories/books_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/book.dart';
import 'want_to_read_event.dart';
import 'want_to_read_state.dart';

class WantToReadBloc extends Bloc<WantToReadEvent, WantToReadState> {
  BooksRepositoryImp booksRepositoryImp;
  WantToReadBloc(this.booksRepositoryImp) : super(WantToReadInitial()) {
    on<WantToReadEvent>((event, emit) async {
      if (event is SubmitWantToReadEvent) {
        var response = await booksRepositoryImp.wantToRead();
        if (response.statusCode == 200) {
          var book =
              booksFromJson(jsonEncode(response.data['data'][0]['books']));
          print(book);
          emit(WantToReadSuccess(book));
        } else {
          emit(WantToReadErrorState('error in load book detail'));
        }
      }
      if (event is AddWantToReadEvent) {
        var response = await booksRepositoryImp.addWantToRead(event.id);
      }
    });
  }
}
