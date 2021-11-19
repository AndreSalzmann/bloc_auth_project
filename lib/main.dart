import 'package:bloc_auth_project/app_navigator.dart';
import 'package:bloc_auth_project/auth/auth_repository.dart';
import 'package:bloc_auth_project/session_cubit.dart';
import 'package:bloc_auth_project/session_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) => SessionCubit(
            authRepository: context.read<AuthRepository>(),
          ),
          child: SessionNavigator(),
        ),
      ),
    );
  }
}


