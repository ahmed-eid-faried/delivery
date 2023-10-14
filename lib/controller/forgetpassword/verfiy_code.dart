import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/data/datasource/remote/forgetpassword/verfiy_code_forget_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerfiyCodeForgetPasswordController extends GetxController {
  verfiyCodeForgetPassword(String verificationCode);
  goToResetPassword();
}

class VerfiyCodeForgetPasswordControllerImp
    extends VerfiyCodeForgetPasswordController {
  late String email;

  VerfiyCodeForgetPasswordData verfiyCodeForgetPasswordData =
      VerfiyCodeForgetPasswordData(Get.find());
  // StatusRequest? statusRequest;
  StatusRequest statusRequest = StatusRequest.noAction;
  @override
  verfiyCodeForgetPassword(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verfiyCodeForgetPasswordData.postData(email, verificationCode);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.toNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Warning",
            backgroundColor: AppColor.primaryColor.withOpacity(0.6),
            middleTextStyle: const TextStyle(color: Colors.white),
            middleText: "Verifycode isn't correct, try again");
        // statusRequest = StatusRequest.noAction;
      }
    }
    update();
  }

  @override
  goToResetPassword() {
    Get.toNamed(AppRoute.resetPassword);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
