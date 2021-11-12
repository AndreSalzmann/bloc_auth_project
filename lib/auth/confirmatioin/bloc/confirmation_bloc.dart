import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_auth_project/auth/auth_credentials.dart';
import 'package:bloc_auth_project/auth/auth_cubit.dart';
import 'package:bloc_auth_project/auth/auth_repository.dart';
import 'package:bloc_auth_project/auth/form_submission_status.dart';
import 'package:meta/meta.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  ConfirmationBloc({
    this.authRepository,
    this.authCubit
  }) : super(ConfirmationState());

  final AuthRepository authRepository;
  final AuthCubit authCubit;

  @override
  Stream<ConfirmationState> mapEventToState(ConfirmationEvent event) async* {
    if (event is ConfirmationCodeChanged) {
      yield state.copyWith(code: event.code);
    }

    if (event is ConfirmationSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        final userId = await authRepository.confirmationSignUp(
          username: authCubit.authCredentials.username,
          confirmationCode: state.code
        );
        yield state.copyWith(formStatus: SubmissionSuccess());

        final credentials = authCubit.authCredentials;
        credentials.userId = userId;
        
        authCubit.launchSession(credentials);
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
