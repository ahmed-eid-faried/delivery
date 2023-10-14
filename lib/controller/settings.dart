// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/settings.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';

abstract class SettingController extends GetxController {
  notification(bool value);
  accepted();
  aboutus();
  contactus();
  logout();
  intialData();
  orders();
  archive();
  getDataView();
  updateData(response);
}

class SettingControllerImp extends SettingController {
  bool? notificationState = true;
  String name = "";
  String email = '';
  String phone = '';
  MyService myServices = Get.find();
  SettingsData settingsData = SettingsData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  List settings = [];
  String deliverytime = "";
  String settingstel = '';
  String settingssms = '';
  String settingsemail = '';
  final box = GetStorage();
  @override
  aboutus() {
    Get.toNamed(AppRoute.aboutus);
  }

  @override
  @override
  logout() {
    String userid = myServices.pref.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic('delivery$userid');
    myServices.pref.clear();
    Get.toNamed(AppRoute.login);
  }

  @override
  notification(value) {
    String? id = myServices.pref.getString("id");
    notificationState = value;
    myServices.pref.setBool("notificationState", value);
    if (notificationState == true) {
      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("delivery$id");
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("delivery$id");
    }
    update();
  }

  @override
  intialData() {
    getDataView();
    bool? state = myServices.pref.getBool("notificationState");
    name = myServices.pref.getString("name")!;
    email = myServices.pref.getString("email")!;
    phone = myServices.pref.getString("phone")!;
    if (state != null) {
      notificationState = state;
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  orders() {
    Get.toNamed(AppRoute.ordersView);
  }

  @override
  archive() {
    Get.toNamed(AppRoute.orderarchive);
  }

  @override
  contactus() {
    Get.toNamed(AppRoute.contactus);
  }

  @override
  void accepted() {
    Get.toNamed(AppRoute.ordersAccepted);
  }

  @override
  getDataView() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await settingsData.getData();
    statusRequest = await handlingData(response);
    if (statusRequest != StatusRequest.offlinefailure) {
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          box.write('settingsControllerImp', response);
          await updateData(response);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      response = await box.read('settingsControllerImp');
      if (response != null) {
        updateData(response);
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  @override
  updateData(response) {
    MyService myService = Get.find();
    settings.addAll(response['settings']);
    deliverytime = settings[0]['settings_deliverytime'];
    settingstel = settings[0]['settings_tel'];
    settingssms = settings[0]['settings_sms'];
    settingsemail = settings[0]['settings_email'];
    myService.pref.setString('deliverytime', deliverytime);
    myService.pref.setString('settingstel', settingstel);
    myService.pref.setString('settingssms', settingssms);
    myService.pref.setString('settingsemail', settingsemail);
  }
}
