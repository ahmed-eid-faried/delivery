import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/data/datasource/remote/forgetpassword/reset_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetpassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController confirmPassword;
  GlobalKey<FormState> formstate = GlobalKey();
  late TextEditingController password;
  late String email;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  @override
  resetPassword() async {
    if (formstate.currentState!.validate() &&
        password.text == confirmPassword.text) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(
        email,
        password.text,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoute.successResetpassword);
        } else {
          Get.defaultDialog(
              title: "Warning",
              backgroundColor: AppColor.primaryColor.withOpacity(0.6),
              middleTextStyle: const TextStyle(color: Colors.white),
              middleText: "Enter NewPassword");
          // statusRequest = StatusRequest.noAction;
        }
      }
      update();
    } else {
      print("Not Valid");
      Get.defaultDialog(
          // title: "Warning",
          backgroundColor: AppColor.primaryColor.withOpacity(0.6),
          middleTextStyle: const TextStyle(color: Colors.white),
          middleText: "Not Match");
    }
  }

  @override
  goToSuccessResetpassword() {
    Get.toNamed(AppRoute.successResetpassword);
  }

  @override
  void onInit() {
    confirmPassword = TextEditingController();
    password = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    confirmPassword.dispose();
    password.dispose();
    super.dispose();
  }
}
