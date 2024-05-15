import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/pages/addrecipe.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<UserController>(
          init: UserController(), // Initialize the controller
          builder: (controller) {
            // Check if user data is available
            final user = controller.userData.value;
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/mainlogo.png"),
                ),
                const SizedBox(height: 10),
                itemProfile(
                  "Name",
                  user?.name ?? "",
                  Icons.person,
                  onTap: () async {
                    final updatedName = await _showInputDialog(
                        context, "Name", user?.name ?? "");
                    if (updatedName != null) {
                      controller.updateUserData(name: updatedName);
                    }
                  },
                ),
                const SizedBox(height: 5),
                itemProfile(
                  "Phone Number",
                  user?.phone ?? "",
                  Icons.phone,
                  onTap: () async {
                    final updatedPhone = await _showInputDialog(
                        context, "Phone Number", user?.phone ?? "");
                    if (updatedPhone != null) {
                      controller.updateUserData(phone: updatedPhone);
                    }
                  },
                ),
                const SizedBox(height: 5),
                itemProfile("Address", "000100", Icons.house),
                const SizedBox(height: 5),
                itemProfile(
                  "Email",
                  user?.email ?? "",
                  Icons.email,
                  onTap: () async {
                    final updatedEmail = await _showInputDialog(
                        context, "Email", user?.email ?? "");
                    if (updatedEmail != null) {
                      controller.updateUserData(email: updatedEmail);
                    }
                  },
                ),
                const SizedBox(height: 5),
                itemProfile("Create Recipes", "my recipes", Icons.my_library_add,onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddRecipePage()));
                }),
                ElevatedButton(
                  onPressed: () => Get.toNamed("/"),
                  child: const Text('Log Out'),
                )
              ],
            );
          },
        ),
      ),
    );
  }

Widget itemProfile(String title, String subtitle, IconData iconData,
      {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: appbartextColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(8, 5),
              color: secondaryColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: ListTile(
          title: Text(title),
          subtitle: Text(
            title == 'Name'
                ? Get.find<UserController>().userData.value?.name ?? ''
                : title == 'Email'
                    ? Get.find<UserController>().userData.value?.email ?? ''
                    : title == 'Phone Number'
                        ? Get.find<UserController>().userData.value?.phone ?? ''
                        : subtitle,
          ),
          leading: Icon(iconData),
          trailing: const Icon(
            Icons.bubble_chart,
            color: primaryColor,
          ),
          tileColor: appbartextColor,
        ),
      ),
    );
  }


Future<String?> _showInputDialog(
      BuildContext context, String title, String initialValue) async {
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController _textFieldController =
            TextEditingController(text: initialValue);
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Enter $title"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () async {
                final updatedValue = _textFieldController.text;
                Navigator.pop(context, updatedValue);
                if (updatedValue.isNotEmpty) {
                  await Get.find<UserController>()
                      .updateUserData(phone: updatedValue, email: updatedValue, name: updatedValue);
                }
              },
            ),
          ],
        );
      },
    );
  }

}

class UserController extends GetxController {
  Rx<UserData?> userData = Rx(null); // Holds user data

  Future<void> updateUserData(
      {String? name, String? email, String? phone}) async {
    try {
      final response = await http.post(
        Uri.parse("https://fluttergroup.xyz/RecipesFelix/update_profile.php"),
        body: {
          'name': name ?? userData.value?.name ?? '',
          'email': email ?? userData.value?.email ?? '',
          'phone': phone ?? userData.value?.phone ?? '',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final userData =
            UserData.fromJson(data); // Parse data to UserData object
        this.userData.value = userData; // Update userData state
        update(); // Inform GetBuilder to rebuild UI
      } else {
        print("Error updating user data: ${response.statusCode}");
      }
    } catch (error) {
      print("Error updating user data: $error");
    }
  }
}

class UserData {
  String name;
  String phone;
  String email;

  UserData({required this.name, required this.phone, required this.email});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json['name'] as String, 
        phone: json['phone'] as String, 
        email: json['email'] as String, 
      );
}
