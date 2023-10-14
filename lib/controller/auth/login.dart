import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/auth/logindata.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  // goToSignUp();
  goToForgetPassword();
  showPassword(bool obscureText);
  saveData(response);
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey();
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  MyService myServices = Get.find();

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        email.text,
        password.text,
      );
      statusRequest = handlingData(response);
      print(statusRequest);
      if (statusRequest == StatusRequest.success) {
        print(response['status']);
        if (response['status'] == "success") {
          if (response['data']['delivery_approve'] == "1") {
            Get.offAllNamed(AppRoute.home);
            saveData(response);
          } else {
            // Get.offAllNamed(AppRoute.verfiyCodeSignUp,
            //     arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Warning",
              backgroundColor: AppColor.primaryColor.withOpacity(0.6),
              middleTextStyle: const TextStyle(color: Colors.white),
              middleText: "Email Or Passwprd Isn't Correct");
          // statusRequest = StatusRequest.noAction;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  // @override
  // goToSignUp() {
  //   Get.offAllNamed(AppRoute.singup);
  // }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  showPassword(bool obscureText) {
    bool obscureTextValue = !obscureText;
    update();
    return obscureTextValue;
  }

  @override
  saveData(response) {
    myServices.pref.setString("id", response['data']['delivery_id']);
    myServices.pref.setString("name", response['data']['delivery_name']);
    myServices.pref.setString("email", response['data']['delivery_email']);
    myServices.pref.setString("phone", response['data']['delivery_phone']);
    myServices.pref.setString("create", response['data']['delivery_create']);
    myServices.pref.setString("login", "2");
    //general for all delivery
    FirebaseMessaging.instance.subscribeToTopic("users");
    //specific for this user by delivery_id
    FirebaseMessaging.instance
        .subscribeToTopic("delivery${response['data']['delivery_id']}");
  }
}
