import 'package:delivery/controller/settings.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTopPartSettings extends StatelessWidget {
  const CustomTopPartSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller = Get.put(SettingControllerImp());
    return Container(
      color: AppColor.backgroundcolor,
      padding: const EdgeInsets.all(15.0),
      height: 150,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(150)),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                  radius: 38,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(controller.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 20, color: AppColor.primaryColor)),
                  Text(controller.phone,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 18)),
                  Text(controller.email,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
