import 'package:bloc/bloc.dart';
import 'package:bloc_auth_project/auth/session/session_cubit.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({this.sessionCubit}) : super(ShowPokedexScreen());

  final SessionCubit sessionCubit;

  void showPokedexScreen() => emit(ShowPokedexScreen());
  void showPokemonDetails(int id) => emit(ShowPokedexScreen(pokemonId: id));

  void showBusinessScreen() => emit(ShowBusinessScreen());
  void showSchoolScreen() => emit(ShowSchoolScreen());

  void navigateTo(int index) {
    print(index);
    switch(index) {
      case 0:
        showPokedexScreen();
        break;
      case 1:
        showBusinessScreen();
        break;
      case 2:
        showSchoolScreen();
        break;
      default:
        showPokedexScreen();
        break;
    }
  }
}
