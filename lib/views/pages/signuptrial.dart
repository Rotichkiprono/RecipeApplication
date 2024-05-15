import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/widgets/customtext.dart';
import 'package:recipetrial/views/widgets/customtextfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController emailcontroller =TextEditingController();
TextEditingController firstnamecontroller =TextEditingController();
TextEditingController secondnamecontroller =TextEditingController();
TextEditingController phonenumberController =TextEditingController();
TextEditingController passwordController =TextEditingController();
TextEditingController repasswordcontroller =TextEditingController();
class Register extends StatelessWidget {
  const Register({super.key});

  @override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          label: "RECIPE APP",
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: primaryColor,
        foregroundColor: appbartextColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), //back navigation
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomText(
                label: 'SIGN UP',
                fontsize: 30.0,
                labelColor: blackColor,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              CustomTextField(
                controller: firstnamecontroller,
                hintText: "First Name",
                icon: Icons.person,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: secondnamecontroller,
                hintText: "Second Name",
                icon: Icons.person,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: phonenumberController,
                hintText: "Phone Number",
                icon: Icons.phone_android,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: emailcontroller,
                hintText: "Email",
                icon: Icons.email,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: passwordController,
                hintText: "Password",
                icon: Icons.password,
                isPassword: true,
                hideText: true,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(
                controller: repasswordcontroller,
                hintText: "Re-enter Password",
                icon: Icons.password,
                isPassword: true,
                hideText: true,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  serverSignup();
                  Get.toNamed("/");
                },
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const CustomText(
                  label:"Sign Up",
                  labelColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void>serverSignup()async{
    http.Response response;
     var body={
  'firstname': firstnamecontroller.text.trim(),
  'secondname': secondnamecontroller.text.trim(),
  'phonenumber': phonenumberController.text.trim(),
  'email': emailcontroller.text.trim(),
  'password': passwordController.text.trim(),
};
    response=await http.post(Uri.parse("https://fluttergroup.xyz/RecipesFelix/signup.php"),body:body );
    if(response.statusCode==200){
      var serverResponse=json.decode(response.body);
      int signedUp=serverResponse['success'];
      if(signedUp==1){

        if (kDebugMode) {
          print("Account Created");
        }
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('firstname', firstnamecontroller.text.trim());
        prefs.setString('phonenumber', phonenumberController.text.trim());
        prefs.setString('email', emailcontroller.text.trim());
        
      }
    }
  }
}