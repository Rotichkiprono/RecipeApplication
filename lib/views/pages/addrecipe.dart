import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({Key? key}) : super(key: key);

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();
  final _recipetitleController = TextEditingController();
  final _durationController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _stepsController = TextEditingController(); // Initial empty string

  @override
  void dispose() {
    _recipetitleController.dispose();
    _durationController.dispose();
    _ingredientsController.dispose();
    _stepsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _recipetitleController,
                decoration: const InputDecoration(
                  labelText: 'Food Category',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a food category.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Duration (minutes)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the duration.';
                  }
                  try {
                    int.parse(value);
                    return null;
                  } catch (e) {
                    return 'Please enter a valid duration (number).';
                  }
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _ingredientsController,
                maxLines: 6, // Allow for multiple lines
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  labelText: 'Ingredients',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ingredients for the recipe.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _stepsController,
                maxLines: 6, // Allow for multiple lines
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  labelText: 'Steps',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the steps for the recipe.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    submitRecipe();
                    _formKey.currentState!.reset();
                  }
                },
                child: const Text('Submit Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submitRecipe() async {
    http.Response response;
    var body = {
      'recipetitle': _recipetitleController.text.trim(),
      'duration': _durationController.text.trim(),
      'steps': _stepsController.text.trim(),
      'ingredients': _ingredientsController.text.trim(),
    };
    response = await http.post(
      Uri.parse("https://fluttergroup.xyz/RecipesFelix/recipeupload.php"),
      body: body,
    );
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int signedUp = serverResponse['success'];
      if (signedUp == 1) {
        if (kDebugMode) {
          print("Recipe Created");
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Recipe added successfully')),
        );
      }
    }
  }
}
