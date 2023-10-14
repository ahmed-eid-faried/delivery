import 'package:delivery/controller/orders/tracking_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsOfroutingBottomSheet extends StatelessWidget {
  const DetailsOfroutingBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingControllerImp());
    return GetBuilder<TrackingControllerImp>(builder: (controller) {
      return Container(
        height: 350,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: ListView(
          children: [
            const Center(
              child: Text(
                'Describtion Of Route',
                style: TextStyle(color: AppColor.primaryColor, fontSize: 20),
              ),
            ),
            ...List.generate(controller.instructions.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text(controller.instructions[index].instruction),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        controller.durationFoem(
                            controller.instructions[index].duration),
                        style: const TextStyle(color: AppColor.primaryColor),
                      ),
                      const Spacer(),
                      Text(
                        controller.distanceForm(
                            controller.instructions[index].distance),
                        style: const TextStyle(color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      );
    });
  }
}
