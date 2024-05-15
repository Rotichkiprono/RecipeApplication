import 'package:flutter/material.dart';
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/pages/addrecipe.dart';
import 'package:recipetrial/views/pages/bakedgoods.dart';
import 'package:recipetrial/views/pages/bevareges.dart';
import 'package:recipetrial/views/pages/fastfood.dart';
import 'package:recipetrial/views/pages/meats.dart';
import 'package:recipetrial/views/pages/soup.dart';
import 'package:recipetrial/views/pages/vegetables.dart';

class Hometrial extends StatefulWidget {
  const Hometrial({super.key});

  @override
  State<Hometrial> createState() => _HometrialState();
}

class _HometrialState extends State<Hometrial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(50))),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                  title: Text(
                    "Hi Chef",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: appbartextColor),
                  ),
                  subtitle: Text(
                    "Welcome Back",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: appbartextColor),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/mainlogo.png"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: appbartextColor,
              ),
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                  children: [
                    itemDashboard(
                      "Fast Food",
                      Icons.fastfood,
                      secondaryColor,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FastFood()),
                      ),
                    ),
                    itemDashboard(
                      "Bevarages",
                      Icons.coffee,
                      Colors.black,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Bevarages()),
                      ),
                    ),
                    itemDashboard(
                      "Meats",
                      Icons.dining,
                      Colors.red,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Meats()),
                      ),
                    ),
                    itemDashboard(
                      "Baked goods",
                      Icons.breakfast_dining,
                      Colors.brown,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Baked()),
                      ),
                    ),
                    itemDashboard(
                      "Vegetables",
                      Icons.grass,
                      Colors.teal,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Vegetables()),
                      ),
                    ),
                    itemDashboard(
                      "Soups",
                      Icons.soup_kitchen,
                      Colors.indigo,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Soup()),
                      ),
                    ),
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddRecipePage()));
                },
                child: const Icon(Icons.add),
                backgroundColor: primaryColor,
              ),
            ),
          ),
        ],
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
