import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:book_tracker/data/repositories/books_repo.dart';
import 'package:book_tracker/peresentation/prefs.dart';

import '../../../data/model/book.dart';
import 'currently_read_event.dart';
import 'currently_read_state.dart';

class CurrentlyReadBloc extends Bloc<CurrentlyReadEvent, CurrentlyReadState> {
  BooksRepositoryImp booksRepositoryImp;
  CurrentlyReadBloc(this.booksRepositoryImp) : super(CurrentlyReadInitial()) {
    on<CurrentlyReadEvent>((event, emit) async {
      if (event is SubmitCurrentlyReadEvent) {
        var response = await booksRepositoryImp.currentlyReading();
        if (response.statusCode == 200) {
          var book =
              booksFromJson(jsonEncode(response.data['data'][0]['books']));
          emit(CurrentlyReadSuccess(book));
        } else {
          emit(CurrentlyReadErrorState('error in load book detail'));
        }
      }
       if (event is AddCurrentlyReadEvent) {
        var response = await booksRepositoryImp.addCurrentlyReading(event.id);
        
        
      }
    });
  }
}
