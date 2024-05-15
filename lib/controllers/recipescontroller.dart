import 'package:get/get.dart';

class RecipesController extends GetxController {
  final recipeList = [].obs;
  updateRecipeList(list) => recipeList.value = list;
}