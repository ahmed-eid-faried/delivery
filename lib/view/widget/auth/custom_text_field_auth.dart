import 'package:delivery/controller/auth/login.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFieldAuth extends StatelessWidget {
  final String label;
  final String? hintText;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  const CustomTextFieldAuth(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.icon,
      this.controller,
      required this.validator,
      this.keyboardType,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool obscureTextValue = obscureText;
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: obscureText == true
            ? GetBuilder<LoginControllerImp>(
                builder: (controllerk) => TextFormField(
                      keyboardType: keyboardType,
                      obscureText: obscureTextValue,
                      validator: validator,
                      controller: controller,
                      decoration: InputDecoration(
                          errorMaxLines: 3,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          suffixIcon: obscureText == false
                              ? Icon(icon)
                              : IconButton(
                                  onPressed: () {
                                    obscureTextValue = controllerk
                                        .showPassword(obscureTextValue);
                                  },
                                  icon: Icon(
                                    icon,
                                    color: obscureTextValue == true
                                        ? null
                                        : AppColor.primaryColor,
                                  )),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: hintText,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 12),
                          //  const TextStyle(fontSize: 14),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          label: Text(label)),
                    ))
            : TextFormField(
                keyboardType: keyboardType,
                validator: validator,
                controller: controller,
                decoration: InputDecoration(
                    errorMaxLines: 3,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    suffixIcon: Icon(icon),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: hintText,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 12),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    label: Text(label)),
              ));
  }
}
