import 'package:bloc_auth_project/auth/auth_credentials.dart';
import 'package:bloc_auth_project/auth/auth_repository.dart';
import 'package:bloc_auth_project/auth/session/session_state.dart';
import 'package:bloc/bloc.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit({this.authRepository}) : super(UnknownSessionState()) {
    attemptAutoLogin();
  }

  final AuthRepository authRepository;

  void attemptAutoLogin() async {
    try {
      final userId = await authRepository.attemptAutoLogin();
      // final user = dataRepo.getUser(userId)
      final user = userId;
      emit(Authenticated(user: user));
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());
  void showSession(AuthCredentials credentials) {
    // final user = dataRepo.getUser(credentials.userId);
    final user = credentials.username;
    emit(Authenticated(user: user));
  }

  void signOut() {
    authRepository.signOut();
    emit(Unauthenticated());
  }
}