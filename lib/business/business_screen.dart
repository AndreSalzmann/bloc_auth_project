import 'package:bloc_auth_project/widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/session/session_cubit.dart';

class BusinessView extends StatelessWidget {
  const BusinessView({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "BussinesView",
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Session started in BusinessScreen"),
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
