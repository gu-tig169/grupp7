import 'ingredientsModel.dart';
import 'instructionsModel.dart';
import '../model.dart';

class RecipeInformation {
  Recipe recipe;
  List<Ingredient> ingredient;
  List<Instruction> instructions;
  RecipeInformation({this.ingredient, this.instructions, this.recipe});
}
