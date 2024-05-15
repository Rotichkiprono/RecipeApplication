import 'package:flutter/material.dart';
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/pages/recipeview.dart';

class Vegetables extends StatefulWidget {
  const Vegetables({super.key});

  @override
  State<Vegetables> createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vegetables'),
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
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Prevent nested scrolling
                children: [
                  itemDashboard("Tomato grilled", Icons.thermostat_auto, secondaryColor,
                      () {
                    navigateToRecipesPage("Tomato grilled");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Salad bowl", Icons.grass_sharp, Colors.black, () {
                    navigateToRecipesPage("Salad bowl");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Potato salad", Icons.roundabout_left_sharp, Colors.black, () {
                    navigateToRecipesPage("Potato salad");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Lettuce salad", Icons.grass, Colors.black, () {
                    navigateToRecipesPage("Lettuce salad");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard(
                      "Greek salad", Icons.graphic_eq_sharp, Colors.black, () {
                   navigateToRecipesPage("Greek salad");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Light salad", Icons.light, Colors.black,
                      () {
                    navigateToRecipesPage("Light salad");
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
