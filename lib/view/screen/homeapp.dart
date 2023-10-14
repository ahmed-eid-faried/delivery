import 'dart:io';

 import 'package:delivery/controller/home_controller.dart';
 import 'package:delivery/view/widget/bottomNavigationBar/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => WillPopScope(
              onWillPop: () {
                Get.defaultDialog(
                  title: "Warning",
                  middleText: "Do You Want To Exit The App",
                  onConfirm: () => exit(0),
                  onCancel: () => Get.back(),
                );
                return Future.value(false);
              },
              child: Scaffold(
                  bottomNavigationBar: const CustomBottomAppBar(),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child:
                            controller.homePages[controller.currentpage].page),
                  )),
            ));
  }
}
