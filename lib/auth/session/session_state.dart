import 'package:bloc_auth_project/auth/auth_credentials.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {

  AuthCredentials credentials;
  int index;

  Authenticated({
    @required this.credentials,
    this.index,
  }) {
    index = 0;
  }

}