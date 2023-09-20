import 'package:bloc/bloc.dart';
import 'package:book_tracker/data/datasource/api_handler.dart';
import 'package:book_tracker/data/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthRepositoryImp authRepositoryImp;
  RegisterBloc(this.authRepositoryImp) : super(RegisterInitial()) {
    on<SubmitRegisterEvent>((event, emit) async {
      var response = await authRepositoryImp.register(
          event.username, event.password1, event.password2);
      if (response.statusCode == 200) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterErrorState('error in sign up'));
      }
    });
  }
}
