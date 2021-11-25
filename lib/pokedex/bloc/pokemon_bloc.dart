import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_auth_project/pokedex/data/pokemon_page_response.dart';
import 'package:bloc_auth_project/pokedex/data/pokemon_repository.dart';
import 'package:meta/meta.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {

  PokemonBloc() : super(PokemonInitial());

  final _pokemonRepository = PokemonRepository();


  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoadInProgress();

      try {
        final pokemonPageResponse =
          await _pokemonRepository.getPokemonPage(event.page);
        yield PokemonPageLoadedSuccess(
          pokemonListings: pokemonPageResponse.pokemonListings,
          conLoadNextPage: pokemonPageResponse.canLoadNextPage
        );
      } catch (e) {
        yield PokemonPageLoadFailed(error: e);
      }
    }



  }
}
