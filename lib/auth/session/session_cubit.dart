import 'package:bloc_auth_project/auth/auth_credentials.dart';
import 'package:bloc_auth_project/auth/auth_repository.dart';
import 'package:bloc_auth_project/auth/session/session_state.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SessionCubit extends HydratedCubit<SessionState> {
  SessionCubit({this.authRepository}) : super(UnknownSessionState()) {
    // not needed anymore with HydratedCubit
    // attemptAutoLogin();
  }



  final AuthRepository authRepository;

  void attemptAutoLogin() async {
    try {
      final userId = await authRepository.attemptAutoLogin();
      // final user = dataRepo.getUser(userId)
      final user = AuthCredentials(username: userId);
      emit(Authenticated(credentials: user));
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());
  void showSession(AuthCredentials credentials) {
    // final user = dataRepo.getUser(credentials.userId);
    emit(Authenticated(credentials: credentials));
  }

  void signOut() {
    authRepository.signOut();
    emit(Unauthenticated());
  }

  @override
  SessionState fromJson(Map<String, dynamic> json) {
    try {
      print(json);
      final AuthCredentials authCredentials = AuthCredentials.fromJson(json);
      return Authenticated(credentials: authCredentials);
    } catch (_) {
      return Unauthenticated();
    }
  }

  @override
  Map<String, dynamic> toJson(SessionState state) {
    if (state is Authenticated) {
      return state.credentials.toJson();
    }
  }

}