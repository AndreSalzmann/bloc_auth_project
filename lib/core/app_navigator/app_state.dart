part of 'app_cubit.dart';

abstract class AppState {
  int index;

  AppState({this.index});
}

class ShowPokedexScreen extends AppState {

  int pokemonId;

  ShowPokedexScreen({
    this.pokemonId
  }) : super(index: 0);

  ShowPokedexScreen copyWith({
    int pokemonId
  }) {
    pokemonId = pokemonId ?? this.pokemonId;
  }
}

class ShowBusinessScreen extends AppState {
  ShowBusinessScreen() : super(index: 1);
}

class ShowSchoolScreen extends AppState {
  ShowSchoolScreen() : super(index: 2);
}