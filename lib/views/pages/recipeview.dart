import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipetrial/models/recipe_model.dart';
import 'package:recipetrial/models/recipecard.dart';

class RecipesPage extends StatefulWidget {
  final String recipetitle;

  const RecipesPage({required this.recipetitle});

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  late Future<List<RecipeModel>> _recipesFuture;

  @override
  void initState() {
    super.initState();
    _recipesFuture = _fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.recipetitle} Recipes'),
      ),
      body: Center(
        child: FutureBuilder<List<RecipeModel>>(
          future: _recipesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(
                  'Error: ${snapshot.error}'); // Handle errors more informatively
            } else {
              final recipes = snapshot.data!;
              return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return RecipeCard(recipe: recipe);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<RecipeModel>> _fetchRecipes() async {
    final response = await http.get(
      Uri.parse('https://fluttergroup.xyz/RecipesFelix/readrecipes.php'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['success'] == 1) {
        final List<dynamic> recipeData = data['data'];
        // Filter recipes based on category
        final filteredRecipes = recipeData
            .map((json) => RecipeModel.fromJson(json))
            .where((recipe) => recipe.recipetitle.contains(widget.recipetitle))
            .toList();
        return filteredRecipes;
      } else {
        throw Exception(
            'Failed to load recipes: ${data['message']}'); // Include error message
      }
    } else {
      throw Exception(
          'Failed to connect to server: Status code ${response.statusCode}'); // More specific error message
    }
  }

}
