import 'ingredients_model.dart';
import 'instructions_model.dart';
import 'model.dart';

class RecipeInformation {
  Recipe recipe;
  List<Ingredient> ingredient;
  List<Instruction> instructions;
  RecipeInformation({this.ingredient, this.instructions, this.recipe});
}
