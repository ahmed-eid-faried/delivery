import 'package:delivery/controller/forgetpassword/verfiy_code.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/view/widget/auth/custom_body_auth.dart';
import 'package:delivery/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerfiyCodeForgetPassword extends StatelessWidget {
  const VerfiyCodeForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "39".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VerfiyCodeForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: ListView(
                children: [
                  CustomTitleAuth(title: "40".tr),
                  CustomBodyAuth(body: "41".tr),
                  CustomBodyAuth(body: controller.email),
                  const SizedBox(height: 15),
                  OtpTextField(
                    fieldWidth: 45.0,
                    borderRadius: BorderRadius.circular(18),
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.verfiyCodeForgetPassword(verificationCode);
                    }, // end onSubmit
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
