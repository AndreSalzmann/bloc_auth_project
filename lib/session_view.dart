import 'package:bloc_auth_project/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionView extends StatelessWidget {
  const SessionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Session started"),
            TextButton(
              onPressed: () {
                BlocProvider.of<SessionCubit>(context).signOut();
              },
              child: Text('Sign out')
            )
          ]
        ),
      ),
    );
  }
}
