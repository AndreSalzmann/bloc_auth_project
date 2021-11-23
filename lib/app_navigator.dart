import 'package:bloc_auth_project/app_cubit.dart';
import 'package:bloc_auth_project/auth/session/session_cubit.dart';
import 'package:bloc_auth_project/auth/session/session_state.dart';
import 'package:bloc_auth_project/auth/session/session_view.dart';
import 'package:bloc_auth_project/business_screen.dart';
import 'package:bloc_auth_project/school_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Navigator(
          pages: [

            if (state is ShowHomeScreen)
              MaterialPage(
                child: SessionView(),
              ),

            if (state is ShowBusinessScreen)
              MaterialPage(
                child: BusinessView()
              ),

            if (state is ShowSchoolScreen)
              MaterialPage(
                child: SchoolView()
              )
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      }
    );

  }
}
