part of 'app_cubit.dart';

abstract class AppState {
  int index;

  AppState({this.index});
}

class ShowHomeScreen extends AppState {
  ShowHomeScreen() : super(index: 0);
}

class ShowBusinessScreen extends AppState {
  ShowBusinessScreen() : super(index: 1);
}

class ShowSchoolScreen extends AppState {
  ShowSchoolScreen() : super(index: 2);
}