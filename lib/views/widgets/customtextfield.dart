import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? icon;
  final bool hideText;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.icon,
    this.hideText = false,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && hideText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          icon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }
}
