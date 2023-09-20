import 'package:bloc/bloc.dart';
import '/data/repositories/auth_repo.dart';
import '../../prefs.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepositoryImp authRepositoryImp;
  LoginBloc(this.authRepositoryImp) : super(LoginInitial()) {
    on<SubmitLoginEvent>((event, emit) async {
      var access = '';
      var response =
          await authRepositoryImp.login(event.username, event.password);
      if (response.statusCode == 200) {
        print(response);
        access = response.data['data']['access'];
        TokenProvider.prefs.setString('access', access);
        print(access);
        emit(LoginSuccess());
      } else {
        emit(LoginErrorState('error in login'));
      }
    });
  }
}
