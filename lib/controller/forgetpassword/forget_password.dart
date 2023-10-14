import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/forgetpassword/forget_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  forgetPassword();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey();
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  MyService myServices = Get.find();
  @override
  forgetPassword() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.postData(
        email.text,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoute.verfiyCodeForgetPassword,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning",
              backgroundColor: AppColor.primaryColor.withOpacity(0.6),
              middleTextStyle: const TextStyle(color: Colors.white),
              middleText: "Email Isn't Correct");
          // statusRequest = StatusRequest.noAction;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
