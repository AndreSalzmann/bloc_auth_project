import 'package:bloc_auth_project/session_cubit.dart';
import 'package:bloc_auth_project/session_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionView extends StatelessWidget {
  const SessionView({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
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
            currentIndex: (state as Authenticated).index,
            selectedItemColor: Colors.amber[800],
            onTap: context.read<SessionCubit>().navigateTo,
          ),
        );
      },
    );
  }
}
