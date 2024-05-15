class RecipeModel {
  final String recipetitle;
  final String ingredients;
  final String duration;
  final String steps;

  const RecipeModel({
    this.recipetitle = '',
    this.ingredients = '',
    this.duration = '',
    this.steps = '',
  });

  factory RecipeModel.fromJson(Map<String, dynamic> map) => RecipeModel(
        recipetitle: map['recipetitle'] as String,
        duration: map['duration'] as String,
        ingredients: map['ingredients'] as String,
        steps: map['steps'] as String,
      );

  Map<String, dynamic> toMap() => {
        'recipetitle': recipetitle,
        'duration': duration,
        'ingredients': ingredients,
        'steps': steps,
      };
}
