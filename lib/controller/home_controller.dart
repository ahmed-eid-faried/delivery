// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery/data/model/home_pages_model.dart';
import 'package:delivery/view/screen/orders/order_accepted.dart';
import 'package:delivery/view/screen/orders/order_archive.dart';
import 'package:delivery/view/screen/orders/orders.dart';
import 'package:delivery/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  changePage(int index);
}

class HomeControllerImp extends HomeController {
  int currentpage = 0;
  List<HomePagesModel> homePages = [
    HomePagesModel(
        title: "Pending", icon: Icons.card_travel, page: const OrdersView()),
    HomePagesModel(
        title: "Accepted",
        icon: Icons.check_circle_outline,
        page: const OrderAccepted()),
    HomePagesModel(
        title: "Archive",
        icon: Icons.archive_outlined,
        page: const OrderArchive()),
    HomePagesModel(
        title: "Settings", icon: Icons.settings , page: const Settings()),
  ];
  @override
  changePage(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
// Firebasema
    super.onInit();
  }
}
