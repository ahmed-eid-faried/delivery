import 'package:delivery/controller/forgetpassword/forget_password.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/function/validinput.dart';
import 'package:delivery/view/widget/auth/custom_body_auth.dart';
import 'package:delivery/view/widget/auth/custom_button_auth.dart';
import 'package:delivery/view/widget/auth/custom_text_field_auth.dart';
import 'package:delivery/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "14".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
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
                    CustomTitleAuth(title: "27".tr),
                    CustomBodyAuth(body: "29".tr),
                    CustomTextFieldAuth(
                        validator: (val) => validator(val, "email"),
                        controller: controller.email,
                        label: "18".tr,
                        hintText: "12".tr,
                        icon: Icons.email_outlined),
                    const SizedBox(height: 20),
                    CustomButtonAuth(
                        text: "30".tr,
                        onPressed: () {
                          controller.forgetPassword();
                          // controller.goToverfiyCodeForgetPassword();
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
