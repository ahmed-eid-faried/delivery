import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/localization/locale.dart';
import 'package:delivery/view/widget/lang/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lang extends GetView<LocaleController> {
  const Lang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Text("1".tr, style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 20),
            CustomButtonLang(
                label: "Ar",
                onPressed: () {
                  controller.changeLang("ar");
                  Get.toNamed(AppRoute.onboarding);
                }),
            CustomButtonLang(
                label: "En",
                onPressed: () {
                  controller.changeLang("en");
                  Get.toNamed(AppRoute.onboarding);
                }),
          ],
        ),
      ),
    );
  }
}
