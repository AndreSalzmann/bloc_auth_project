import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_auth_project/auth/auth_credentials.dart';
import 'package:bloc_auth_project/auth/auth_cubit.dart';
import 'package:bloc_auth_project/auth/auth_repository.dart';
import 'package:bloc_auth_project/auth/form_submission_status.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    this.authRepository,
    this.authCubit,
  }) : super(LoginState());

  final AuthRepository authRepository;
  final AuthCubit authCubit;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    }

    if(event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    }

    if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final userId = await authRepository.login(
          username: state.username,
          password: state.password
        );
        yield state.copyWith(formStatus: SubmissionSuccess());

        authCubit.launchSession(AuthCredentials(
          username: state.username,
          userId: userId,
        ));
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
