import 'package:delivery/controller/auth/login.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/function/alertexitapp.dart';
import 'package:delivery/core/function/validinput.dart';
import 'package:delivery/view/widget/auth/custom_body_auth.dart';
import 'package:delivery/view/widget/auth/custom_button_auth.dart';
import 'package:delivery/view/widget/auth/custom_text_field_auth.dart';
import 'package:delivery/view/widget/auth/custom_title_auth.dart';
import 'package:delivery/view/widget/auth/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "15".tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const LogoAuth(),
                      CustomTitleAuth(title: '10'.tr),
                      CustomBodyAuth(body: "11".tr),
                      CustomTextFieldAuth(
                          validator: (val) => validator(val, "email"),
                          controller: controller.email,
                          label: "18".tr,
                          hintText: "12".tr,
                          icon: Icons.email_outlined),
                      CustomTextFieldAuth(
                          validator: (val) => validator(val, "password"),
                          controller: controller.password,
                          obscureText: true,
                          label: "19".tr,
                          hintText: "13".tr,
                          icon: Icons.lock_outlined),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "14".tr,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButtonAuth(
                          text: "15".tr,
                          onPressed: () {
                            controller.login();
                          }),
                      const SizedBox(height: 20),
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
