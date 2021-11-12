part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpUsernameChanged extends SignUpEvent {
  final String username;

  SignUpUsernameChanged({this.username});
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;

  SignUpPasswordChanged({this.password});
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;

  SignUpEmailChanged({this.email});
}

class SignUpSubmitted extends SignUpEvent {}