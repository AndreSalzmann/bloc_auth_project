import 'package:bloc_auth_project/auth/session/session_cubit.dart';
import 'package:bloc_auth_project/auth/session/session_state.dart';
import 'package:bloc_auth_project/widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return AppScaffold(
      title: "HomeScreen",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Session started in HomeScreen"),
            BlocBuilder<SessionCubit, SessionState>(
              builder: (context, state) {
                String username;
                if (state is Authenticated) {
                  username = state.credentials.username;
                }

                return Text("Hallo, $username");
              }
            ),
            TextButton(
              onPressed: () {
                context.read<SessionCubit>().signOut();
              },
              child: Text('Sign out')
            )
          ]
        ),
      ),
    );
  }
}
