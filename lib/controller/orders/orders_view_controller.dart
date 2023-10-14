import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/function/handling_data.dart';
 import 'package:delivery/core/function/get_des_of_position.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/datasource/remote/order/orders.dart';
import 'package:delivery/data/model/orders.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrdersViewController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());

  late StatusRequest statusRequest;
  // String? userid;
  MyService myServices = Get.find();
  List<OrdersModel> data = [];
  String? deliveryid;
  LocationMap locationMap = LocationMap();
  LatLng? position = const LatLng(0, 0);
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.viewOrders();
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
        return "Archive";
    }
  }

  accepted(String? userid, String? ordersid) async {
    statusRequest = StatusRequest.loading;
    update();
    deliveryid = myServices.pref.getString("id");
    var response = await ordersData.approveOrders(
      ordersid!,
      userid!,
      deliveryid!,
      position!.latitude.toString(),
      position!.longitude.toString(),
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

  getPosition() async {
    await locationMap.check(statusRequest);
    Position positionk = await Geolocator.getCurrentPosition();
    position = LatLng(positionk.latitude, positionk.longitude);
    update();
  }

  @override
  void onInit() async {
    getData();
    await getPosition();

    super.onInit();
  }
}
