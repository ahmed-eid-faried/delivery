import 'package:delivery/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const CustomButtonLang(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MaterialButton(
        minWidth: 200,
        height: 50,
        onPressed: onPressed,
        color: AppColor.primaryColor,
        child: Text(label,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white)),
      ),
    );
  }
}
