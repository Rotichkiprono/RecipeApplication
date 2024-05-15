import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/pages/recipeview.dart';
import 'package:recipetrial/views/widgets/customtext.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> _searchResults = [];
  final TextEditingController _searchController = TextEditingController();

  Future<void> _searchRecipes(String query) async {
    final encodedQuery = Uri.encodeQueryComponent(query);
    final url = Uri.parse(
        "https://fluttergroup.xyz/RecipesFelix/search.php?query=$encodedQuery");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        _searchResults = data.cast<String>();
      });
    } else {
      throw Exception('Failed to load search results');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          label: 'SEARCH RECIPES',
          labelColor: appbartextColor,
          fontWeight: FontWeight.normal,
        ),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by recipe title',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchRecipes(_searchController.text);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _searchResults.isNotEmpty
                  ? ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final recipeTitle = _searchResults[index];
                        return ListTile(
                          title: Text(recipeTitle),
                          onTap: () {
                            navigateToRecipesPage(recipeTitle);
                          },
                        );
                      },
                    )
                  : const Center(
                      child: Text('No results found'),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToRecipesPage(String recipeTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipesPage(recipetitle: recipeTitle),
      ),
    );
  }
}
