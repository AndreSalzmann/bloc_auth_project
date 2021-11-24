
import 'package:bloc_auth_project/business/business_screen.dart';
import 'package:bloc_auth_project/school/school_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/home_screen.dart';
import 'app_cubit.dart';

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
                child: HomeView(),
              ),

            if (state is ShowBusinessScreen)
              MaterialPage(
                child: BusinessView()
              ),

            if (state is ShowSchoolScreen)
              MaterialPage(
                child: SchoolView()
              ),

          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      }
    );

  }
}
