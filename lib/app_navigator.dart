import 'package:bloc_auth_project/session_cubit.dart';
import 'package:bloc_auth_project/session_state.dart';
import 'package:bloc_auth_project/session_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        return Navigator(
          pages: [
              MaterialPage(
                child: SessionView(),
              )
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      }
    );

  }
}
