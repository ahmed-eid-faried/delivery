import 'package:delivery/core/constant/color.dart';
import 'package:delivery/controller/contactus/contact_us_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ContactUsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        title: const Text("Contact Us"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(color: AppColor.primaryColor, Icons.arrow_back),
        ),
      ),
      body: GetBuilder<ContactUsController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(
                      color: AppColor.primaryColor, Icons.chat_outlined),
                  title: const Text("whatsapp"),
                  onTap: () {
                    controller.whatsapp();
                  },
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(color: AppColor.primaryColor)),
                ListTile(
                  leading: const Icon(
                      color: AppColor.primaryColor, Icons.email_outlined),
                  title: const Text("Send Email"),
                  onTap: () {
                    controller.launchMail();
                  },
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(color: AppColor.primaryColor)),
                ListTile(
                  leading: const Icon(
                      color: AppColor.primaryColor, Icons.sms_outlined),
                  title: const Text("Send SMS"),
                  onTap: () {
                    controller.launchSMS();
                  },
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(color: AppColor.primaryColor)),
                ListTile(
                  leading: const Icon(
                      color: AppColor.primaryColor,
                      Icons.phone_android_outlined),
                  title: const Text("Call Us"),
                  onTap: () {
                    controller.launchTel();
                  },
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(color: AppColor.primaryColor)),
              ],
            ),
          );
        },
      ),
    );
  }
}
