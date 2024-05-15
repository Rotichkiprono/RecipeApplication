import 'package:flutter/material.dart';
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/pages/recipeview.dart';

class FastFood extends StatefulWidget {
  const FastFood({Key? key}) : super(key: key);

  @override
  State<FastFood> createState() => _FastFoodState();
}

class _FastFoodState extends State<FastFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fastfoods'),
        leading: const BackButton(),
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: ListView(
                // Use ListView for vertical scrolling
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // Prevent nested scrolling
                children: [
                  itemDashboard("Fries", Icons.fastfood, secondaryColor, () {
                    navigateToRecipesPage("Fries");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Burgers", Icons.fastfood_sharp, Colors.black,
                      () {
                    navigateToRecipesPage("Burgers");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard(
                      "OnionRings", Icons.spoke_outlined, Colors.black, () {
                    navigateToRecipesPage("OnionRings");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Sausages", Icons.coffee, Colors.black, () {
                    navigateToRecipesPage("Sausages");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Hotdogs", Icons.hot_tub_rounded, Colors.black,
                      () {
                    navigateToRecipesPage("Hotdogs");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Samosa", Icons.play_arrow, Colors.black, () {
                    navigateToRecipesPage("Samosa");
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
