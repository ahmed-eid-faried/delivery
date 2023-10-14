import 'package:delivery/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCartAndChechout extends StatelessWidget {
  const CustomButtonCartAndChechout(
      {super.key, required this.title, this.onTap, this.padding = 0});
  final String title;
  final void Function()? onTap;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(padding),
        width: double.infinity,
        height: 40,
        color: AppColor.secondColor,
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
