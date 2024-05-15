import 'package:flutter/material.dart';
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/pages/recipeview.dart';

class Baked extends StatefulWidget {
  const Baked({super.key});

  @override
  State<Baked> createState() => _BakedState();
}

class _BakedState extends State<Baked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baked Goods'),
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
                   itemDashboard("Cake", Icons.cake, secondaryColor, () {
                    navigateToRecipesPage("Cake");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Bread", Icons.breakfast_dining, Colors.black,
                      () {
                    navigateToRecipesPage("Bread");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard(
                      "Cookie", Icons.cookie_rounded, Colors.black, () {
                    navigateToRecipesPage("Cookie");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Muffins", Icons.radar, Colors.black, () {
                    navigateToRecipesPage("Muffins");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Biscuits", Icons.code_off, Colors.black,
                      () {
                    navigateToRecipesPage("Biscuits");
                  }),
                  const SizedBox(height: 20),
                  itemDashboard("Pizza", Icons.local_pizza_outlined, Colors.black, () {
                    navigateToRecipesPage("Pizza");
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
