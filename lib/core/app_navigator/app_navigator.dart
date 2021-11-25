
import 'package:bloc_auth_project/business/business_screen.dart';
import 'package:bloc_auth_project/pokedex/bloc/pokemon_bloc.dart';
import 'package:bloc_auth_project/pokedex/bloc/pokemon_details_cubit.dart';
import 'package:bloc_auth_project/pokedex/pokemon_details_screen.dart';
import 'package:bloc_auth_project/school/school_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pokedex/pokedex_screen.dart';
import 'app_cubit.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Navigator(
          pages: [

            ...addPokedexViews(context, state),

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

  List<MaterialPage> addPokedexViews(context, state) {
    List<MaterialPage> pokeViews = [
      if (state is ShowPokedexScreen)
        MaterialPage(
          child: BlocProvider(
            create: (context) => PokemonBloc()..add(PokemonPageRequest(page: 0)),
            child: PokedexView()
          )
        )
    ];

    if (state is ShowPokedexScreen) {
      if (state.pokemonId != null) {
        pokeViews.add(
          MaterialPage(
              child: BlocProvider(
                create: (context) => PokemonDetailsCubit()
                  ..getPokemonDetails(state.pokemonId),
                child: PokemonDetailsView()
              )
          )
        );
      }
    }

    return pokeViews;
  }
}
