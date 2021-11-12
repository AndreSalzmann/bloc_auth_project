import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_auth_project/auth/auth_cubit.dart';
import 'package:bloc_auth_project/auth/auth_repository.dart';
import 'package:bloc_auth_project/auth/form_submission_status.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    this.authRepository,
    this.authCubit
  }) : super(SignUpState());

  final AuthRepository authRepository;
  final AuthCubit authCubit;

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpUsernameChanged) {
      yield state.copyWith(username: event.username);
    }

    if(event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);
    }

    if(event is SignUpEmailChanged) {
      yield state.copyWith(email: event.email);
    }

    if (event is SignUpSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepository.signUp(
          username: state.username,
          email: state.email,
          password: state.password
        );
        yield state.copyWith(formStatus: SubmissionSuccess());

        authCubit.showConfirmSignUp(
          username: state.username,
          email: state.email,
          password: state.password,
        );
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
