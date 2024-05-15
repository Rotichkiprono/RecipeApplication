import 'package:flutter/material.dart';
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/pages/recipeview.dart';

class Soup extends StatefulWidget {
  const Soup({super.key});

  @override
  State<Soup> createState() => _SoupState();
}

class _SoupState extends State<Soup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soups'),
        leading: BackButton(),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: appbartextColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: ListView(
                // Use ListView for vertical scrolling
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Prevent nested scrolling
                children: [
                  // Directly use itemDashboard functions for ListView items
                  itemDashboard("Chicken stew", Icons.hot_tub, secondaryColor,
                      () {
                    navigateToRecipesPage("Chiken stew");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Noodle soup", Icons.no_food_outlined, Colors.black, () {
                    navigateToRecipesPage("Noodle soup");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Medicinal Soup", Icons.medical_information, Colors.black, () {
                   navigateToRecipesPage("Medicinal soup");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Meat stew", Icons.dining, Colors.black, () {
                    navigateToRecipesPage("Meat stew");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard(
                      "Vegetable soup", Icons.grass, Colors.black, () {
                    navigateToRecipesPage("Vegetable soup");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Peanut stew", Icons.stream, Colors.black,
                      () {
                    navigateToRecipesPage("Peanut stew");
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToRecipesPage(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipesPage(recipetitle: category),
      ),
    );
  }

Widget itemDashboard(String title, IconData iconData, Color backgroundColor,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: appbartextColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: appbartextColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
