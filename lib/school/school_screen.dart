import 'package:bloc_auth_project/widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/session/session_cubit.dart';

class SchoolView extends StatelessWidget {
  const SchoolView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "SchoolView",
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Session started in SchoolScreen"),
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
