import 'package:get/get.dart';
import 'package:recipetrial/views/pages/homepage.dart';
import 'package:recipetrial/views/pages/profile.dart';
import 'package:recipetrial/views/pages/search.dart';

class navigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [ const Hometrial(),const SearchPage(),  const ProfileScreen()];
}
