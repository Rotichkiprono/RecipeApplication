import 'package:flutter/material.dart';
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/pages/recipeview.dart';

class Meats extends StatefulWidget {
  const Meats({super.key});

  @override
  State<Meats> createState() => _MeatsState();
}

class _MeatsState extends State<Meats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meats'),
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
                  itemDashboard("Chicken", Icons.coffee_rounded, secondaryColor,
                      () {
                    navigateToRecipesPage("Chiken");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Roast Beef", Icons.coffee_maker, Colors.black, () {
                    navigateToRecipesPage("Roast Beef");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Pulled Pork", Icons.water_drop, Colors.black, () {
                    navigateToRecipesPage("Pulled Pork");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Minced Meat", Icons.bubble_chart, Colors.black, () {
                    navigateToRecipesPage("Minced Meat");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard(
                      "Nyama Choma", Icons.radio_button_checked, Colors.black, () {
                    navigateToRecipesPage("Nyama");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Matumbo", Icons.coffee_maker, Colors.black,
                      () {
                    navigateToRecipesPage("Matumbo");
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
