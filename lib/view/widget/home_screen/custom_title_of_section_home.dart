import 'package:delivery/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTitleOfSectionHome extends StatelessWidget {
  final String title;
  const CustomTitleOfSectionHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }
}
