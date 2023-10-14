import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/order/accepted.dart';
import 'package:delivery/data/model/orders.dart';
import 'package:get/get.dart';

class AcceptedOrdersViewController extends GetxController {
  AcceptedOrdersData acceptedOrdersData = AcceptedOrdersData(Get.find());

  late StatusRequest statusRequest;
  String? deliveryid;
  MyService myServices = Get.find();
  List<OrdersModel> data = [];

  getData() async {
    deliveryid = myServices.pref.getString("id");
    print(deliveryid);
    statusRequest = StatusRequest.loading;
    update();
    var response = await acceptedOrdersData.viewOrders(deliveryid!);
    print(response);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      print(statusRequest);
      if (response['status'] == "success") {
        List responseData = response['data'];
        data = responseData.map((e) => OrdersModel.fromJson(e)).toList();
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getValOfReciveType(String val) {
    return val == "0" ? "Delivery" : "Receipt From The Store";
  }

  getValOfPaymentMethod(String val) {
    return val == "0" ? "Cash" : "Payment Method";
  }

  getValOfOrderStatus(String val) {
    switch (val) {
      case "0":
        return "Pending Approval";
      case "1":
        return "The order is being prepared";
      case "2":
        return "Ready to picked up by delivery man";
      case "3":
        return "on the man";
      default:
        return "Accepted";
    }
  }

  doneOrders(String? userid, String? ordersid) async {
    statusRequest = StatusRequest.loading;
    update();
    deliveryid = myServices.pref.getString("id");
    var response = await acceptedOrdersData.doneOrders(
      userid!,
      ordersid!,
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.home);
      } else {
        Get.defaultDialog(middleText: "No Orders");
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
