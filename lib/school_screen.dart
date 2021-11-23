import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubit.dart';
import 'auth/session/session_cubit.dart';

class SchoolView extends StatelessWidget {
  const SchoolView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Session'),
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
          body: Center(
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
