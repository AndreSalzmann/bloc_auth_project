import 'package:flutter/material.dart';

abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {

  final dynamic user;
  int index;

  Authenticated({
    @required this.user,
    this.index,
  }) {
    index = 0;
  }

}