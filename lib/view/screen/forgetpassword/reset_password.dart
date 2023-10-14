import 'package:delivery/controller/forgetpassword/reset_password.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/function/validinput.dart';
import 'package:delivery/view/widget/auth/custom_body_auth.dart';
import 'package:delivery/view/widget/auth/custom_button_auth.dart';
import 'package:delivery/view/widget/auth/custom_text_field_auth.dart';
import 'package:delivery/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "43".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    CustomTitleAuth(title: "35".tr),
                    CustomBodyAuth(body: "34".tr),
                    CustomTextFieldAuth(
                        validator: (val) => validator(val, "password"),
                        controller: controller.password,
                        hintText: "13".tr,
                        label: "19".tr,
                        icon: Icons.lock_outline),
                    CustomTextFieldAuth(
                        validator: (val) => validator(val, "password"),
                        controller: controller.confirmPassword,
                        hintText: "42".tr,
                        label: "19".tr,
                        icon: Icons.lock_outline),
                    const SizedBox(height: 20),
                    CustomButtonAuth(
                        text: "33".tr,
                        onPressed: () {
                          controller.resetPassword();
                          // controller.goToSuccessResetpassword();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
