import 'package:flutter/material.dart';
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/models/recipe_model.dart';
import 'package:recipetrial/views/widgets/customtext.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe title
            Text(
              recipe.recipetitle,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10.0),
            // Row for duration and steps
            Row(
              children: [
                // Display duration icon
                const Icon(Icons.timer, size: 16.0),
                const SizedBox(width: 5.0),
                Text('${recipe.duration} minutes'),
              ],
            ),
            const SizedBox(height: 10.0),
            // Recipe ingredients
            const CustomText(
              label: 'Ingredients:',
              labelColor: primaryColor,
              fontWeight: FontWeight.bold),
            const SizedBox(height: 5.0),
            // List of ingredients
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe.ingredients
                  .split(',')
                  .map((ingredient) => Text('• $ingredient'))
                  .toList(),
            ),
            const SizedBox(height: 10.0),
            // Recipe steps
            const CustomText(
              label: 'Steps:',
              labelColor: primaryColor,
              fontWeight: FontWeight.bold),
            const SizedBox(height: 5.0),
            // List of steps
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe.steps
                  .split('\n')
                  .map((step) => Text('• $step'))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
