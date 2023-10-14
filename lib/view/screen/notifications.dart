import 'package:delivery/data/model/notifications_data_model.dart';
import 'package:delivery/view/screen/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/class/handling_data_view.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          title: const Text("Notifications"),
          leading: IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.home);
              },
              icon: const Icon(Icons.arrow_back))),
      body: GetBuilder<NotificationsController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: Container(
                margin: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    NotificationsDataModel notificationsDataModel =
                        controller.data[index];
                    return Card(
                      child: ListTile(
                        title: Text(notificationsDataModel.notificationsTitle!,
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 20),
                            maxLines: 1),
                        leading:
                            const Icon(Icons.notifications_active, size: 30),
                        subtitle: Text(
                            notificationsDataModel.notificationsBody!,
                            textAlign: TextAlign.start,
                            maxLines: 3),
                        trailing: Text(
                          Jiffy.parse(
                                  notificationsDataModel.notificationsDatetime!,
                                  pattern: "yyyy-MM-dd")
                              .fromNow()
                              .toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        ),
                      ),
                    );
                  },
                ),
              ));
        },
      ),
    );
  }
}
