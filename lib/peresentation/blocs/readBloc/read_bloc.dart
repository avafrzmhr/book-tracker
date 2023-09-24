import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:book_tracker/data/repositories/books_repo.dart';
import 'package:book_tracker/peresentation/prefs.dart';

import '../../../data/model/book.dart';
import 'read_event.dart';
import 'read_state.dart';

class ReadBloc extends Bloc<ReadEvent, ReadState> {
  BooksRepositoryImp booksRepositoryImp;
  ReadBloc(this.booksRepositoryImp) : super(ReadInitial()) {
    on<ReadEvent>((event, emit) async {
      if (event is SubmitReadEvent) {
        var response = await booksRepositoryImp.read();
        if (response.statusCode == 200) {
          var book =
              booksFromJson(jsonEncode(response.data['data'][0]['books']));
          emit(ReadSuccess(book));
        } else {
          emit(ReadErrorState('error in load book detail'));
        }
      }
      if (event is AddReadEvent) {
        var response = await booksRepositoryImp.addRead(event.id);
        
        
      }
    });
  }
}
