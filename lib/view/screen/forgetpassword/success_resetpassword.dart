import 'package:delivery/controller/forgetpassword/success_resetpassword.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetpassword extends StatelessWidget {
  const SuccessResetpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetpasswordControllerImp controller =
        Get.put(SuccessResetpasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          '32'.tr,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text("37".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 30)),
            Text("36".tr),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                  text: "31".tr,
                  onPressed: () {
                    controller.goToLogin();
                  }),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
