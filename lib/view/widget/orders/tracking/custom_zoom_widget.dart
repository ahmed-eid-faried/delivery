import 'package:delivery/controller/orders/tracking_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/view/widget/orders/tracking/details_ofrouting_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomZoomWidget extends StatelessWidget {
  const CustomZoomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingControllerImp());
    return GetBuilder<TrackingControllerImp>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(controller.distanceForm(controller.distance.ceil().toDouble(),
                distanceMeter: false)),
            Text(
              controller.durationFoem(controller.duration.inSeconds.toDouble()),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.increaseZoom();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: AppColor.primaryColor,
                )),
            ElevatedButton(
                onPressed: () {
                  controller.decreaseZoom();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Icon(
                  Icons.remove,
                  size: 30,
                  color: AppColor.primaryColor,
                )),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(const DetailsOfroutingBottomSheet());
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                child: const Icon(
                  Icons.directions_outlined,
                  size: 30,
                  color: AppColor.primaryColor,
                )),
          ],
        ),
      );
    });
  }
}
