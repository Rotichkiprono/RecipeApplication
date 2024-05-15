import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recipetrial/utils/routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(GetMaterialApp(
    initialRoute: "/",
    debugShowCheckedModeBanner: false,
    getPages: Routes.routes,
  ));
}
