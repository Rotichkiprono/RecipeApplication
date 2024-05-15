import 'package:get/get.dart';
import 'package:recipetrial/utils/navigator_menu.dart';
import 'package:recipetrial/views/pages/logintrial.dart';
import 'package:recipetrial/views/pages/profile.dart';
import 'package:recipetrial/views/pages/signuptrial.dart';

class Routes {
  static var routes = [
    GetPage(name: "/", page: () => Login()),
    GetPage(name: "/signup", page: () => Register()),
    GetPage(name: "/homepage", page: () => const Navigatormenu()),
    GetPage(name: "/profile", page: () => const ProfileScreen()),

  ];
}
