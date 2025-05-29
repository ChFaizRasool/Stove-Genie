import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stove_genie/bloc/state/recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeInitial());
}
