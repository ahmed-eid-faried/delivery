import 'package:delivery/controller/orders/tracking_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCallAndDoneWidet extends StatelessWidget {
  const CustomCallAndDoneWidet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TrackingControllerImp controller = Get.put(TrackingControllerImp());
    return Positioned(
      bottom: 20,
      child: SizedBox(
        height: 50,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColor.fifthColor)),
                onPressed: () {
                  controller.doneOrders();
                },
                child: const Text("Done")),
            const SizedBox(width: 60),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColor.fifthColor)),
                onPressed: () {
                  controller.callPhone();
                },
                child: const Icon(
                  Icons.call,
                  size: 30,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
