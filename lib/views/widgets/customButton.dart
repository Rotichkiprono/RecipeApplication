import 'package:flutter/material.dart';
import 'package:recipetrial/configs/constants.dart';
import 'package:recipetrial/views/widgets/customtext.dart';

class customButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String buttonLabel;
  final VoidCallback? action;

  const customButton({
    super.key,
    required this.buttonLabel,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: CustomText(
        label: buttonLabel,
        labelColor: appbartextColor,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        elevation: 10,
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
