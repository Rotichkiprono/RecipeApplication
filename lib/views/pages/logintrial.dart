import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/widgets/customtext.dart';
import 'package:recipetrial/views/widgets/customtextfield.dart';

class Login extends StatelessWidget {
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CustomText(
          label: "RECIPE APP",
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: primaryColor,
        foregroundColor: appbartextColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
              label: 'WHATS COOKING !!',
              fontsize: 30.0,
              labelColor: primaryColor,
            ),
            const SizedBox(height: 30.0),
            CustomTextField(
              controller: phonenumberController,
              icon: Icons.person,
              hintText: "Phone Number",
            ),
            const SizedBox(height: 20.0),
            CustomTextField(
              controller: passwordController,
              hintText: "Password",
              isPassword: true,
              hideText: true,
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    
                  },
                  child: const CustomText(
                    label: "Forgot Password?",
                    labelColor: primaryColor,
                    fontsize: 15.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_validateInputs()) {
                  _remoteLogin(
                    phonenumberController.text.trim(),
                    passwordController.text.trim(),
                    context,
                  );
                } else {
                  _showErrorDialog(
                      context, "Please provide phone number and password");
                }
              },
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const CustomText(
                label: "Login",
                labelColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => Get.toNamed("/signup"),
              style: TextButton.styleFrom(
                primary: primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const CustomText(
                label: "Sign Up",
                labelColor: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }


  bool _validateInputs() {
    return phonenumberController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty;
  }

  void _remoteLogin(
      String phonenumber, String password, BuildContext context) async {
    try {
      final response = await http.get(Uri.parse(
          "https://fluttergroup.xyz/RecipesFelix/login.php?phonenumber=$phonenumber&password=$password"));

      if (response.statusCode == 200) {
        var serverResponse = json.decode(response.body);
        int loginStatus = serverResponse['success'];
        if (loginStatus == 1) {
          Get.toNamed("/homepage");
        } else {
          _showErrorDialog(context, "Phone number or password is invalid");
        }
      } else {
        _showErrorDialog(context, "Server Error ${response.statusCode}");
      }
    } catch (e) {
      _showErrorDialog(context, "Error: $e");
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
