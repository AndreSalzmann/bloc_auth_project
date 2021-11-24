import 'package:bloc_auth_project/auth/session/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/app_navigator/app_cubit.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key key,
    @required this.child,
    this.title,
  }) : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.logout),
                ),
                onTap: () => BlocProvider.of<SessionCubit>(context).signOut(),
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            currentIndex: state.index,
            selectedItemColor: Colors.amber[800],
            onTap: context.read<AppCubit>().navigateTo,
          ),
        );
      },
    );
  }
}
