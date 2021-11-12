import 'package:bloc_auth_project/auth/auth_cubit.dart';
import 'package:bloc_auth_project/auth/auth_navigator.dart';
import 'package:bloc_auth_project/session_cubit.dart';
import 'package:bloc_auth_project/session_state.dart';
import 'package:bloc_auth_project/session_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_view.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            // Show loading screen
            if (state is UnknownSessionState)
              MaterialPage(child: LoadingView()),

            // Show auth flow
            if (state is Unauthenticated)
              MaterialPage(
                child: BlocProvider(
                  create: (context) => AuthCubit(
                    sessionCubit: context.read<SessionCubit>(),
                  ),
                  child: AuthNavigator(),
                ),
              ),

            // Show session flow
            if (state is Authenticated) MaterialPage(child: SessionView()),
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      }
    );

  }
}
