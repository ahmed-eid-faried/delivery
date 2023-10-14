import 'dart:io';

import 'package:delivery/core/constant/routes.dart';
import 'package:get/get.dart';

//  Get.offNamed(AppRoute.home)
Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: "Warning",
    middleText: "Do You Want To Exit The App",
    onConfirm: () => exit(0),
    onCancel: () => Get.back(),
  );
  return Future.value(false);
}

Future<bool> backAppHome() {
  // HomeControllerImp.currentpage = 0;
  Get.offAllNamed(AppRoute.home);
  // Get.back(closeOverlays: true);
  return Future.value(true);
}

Future<bool> backApp(String appRoute) {
   Get.offNamed(appRoute);
   return Future.value(true);
}
