import 'package:bloc/bloc.dart';
import 'package:bloc_auth_project/auth/auth_credentials.dart';
import 'package:bloc_auth_project/session_cubit.dart';


enum AuthState { login, signUp, confirmSignUp }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({this.sessionCubit}) : super(AuthState.login);

  AuthCredentials authCredentials;
  final SessionCubit sessionCubit;

  void showLogin() => emit(AuthState.login);
  void showSignUp() => emit(AuthState.signUp);

  void showConfirmSignUp({
    String username,
    String email,
    String password
  }) {
    authCredentials = AuthCredentials(
      username: username,
      email: email,
      password: password,
    );
    emit(AuthState.confirmSignUp);
  }

  void launchSession(AuthCredentials credentials) {
    sessionCubit.showSession(credentials);
  }
}
