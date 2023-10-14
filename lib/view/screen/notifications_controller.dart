
import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/notifications_data.dart';
import 'package:delivery/data/model/notifications_data_model.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  NotificationsData notificationsData = NotificationsData(Get.find());
  late StatusRequest statusRequest;
  String? userid;
  MyService myServices = Get.find();
  List<NotificationsDataModel> data = [];

  getData() async {
    userid = myServices.pref.getString("id");
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsData.getData(userid!);
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      print(statusRequest);
      if (response['status'] == "success") {
        List responseData = response['data'];
        data = responseData
            .map((e) => NotificationsDataModel.fromJson(e))
            .toList();
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }
}
