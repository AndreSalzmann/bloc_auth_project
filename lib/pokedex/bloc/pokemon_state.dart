part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadedSuccess extends PokemonState {
  final List<PokemonListing> pokemonListings;
  final bool conLoadNextPage;

  PokemonPageLoadedSuccess({
    @required this.pokemonListings, @required this.conLoadNextPage
  });
}

class PokemonPageLoadFailed extends PokemonState {
  final Error error;

  PokemonPageLoadFailed({@required this.error});
}