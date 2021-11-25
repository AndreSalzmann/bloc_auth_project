import 'package:bloc_auth_project/auth/session/session_cubit.dart';
import 'package:bloc_auth_project/auth/session/session_state.dart';
import 'package:bloc_auth_project/core/app_navigator/app_cubit.dart';
import 'package:bloc_auth_project/pokedex/bloc/pokemon_bloc.dart';
import 'package:bloc_auth_project/widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return AppScaffold(
      title: "HomeScreen",
      child: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if(state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          else if(state is PokemonPageLoadedSuccess) {
            return GridView.builder(
              gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => context.read<AppCubit>().showPokemonDetails(
                    state.pokemonListings[index].id
                  ),
                  child: Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(state.pokemonListings[index].imageUrl),
                          Text(state.pokemonListings[index].name),
                        ],
                      ),
                    ),
                  ),
                );
              }
            );
          }

          else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          }

          else {
            return Container();
          }

        },
      )
    );
  }
}
