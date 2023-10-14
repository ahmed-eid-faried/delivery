 import 'package:delivery/core/function/get_des_of_position.dart';
import 'package:delivery/data/datasource/remote/order/order_details_data.dart';
import 'package:delivery/data/model/ordersitemsmodel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/function/handling_data.dart';
import 'package:delivery/data/model/orders.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel ordersModel;
  StatusRequest statusRequest = StatusRequest.noAction;
  String ordersAddress = "";
  String ordersRecivetype = "";
  String addressCity = "";
  String addressStreet = "";
  String ordersId = "";
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  List<OrdersItemsModel> itemsData = [];
  LocationMap locationMap = LocationMap();
  Position? position;
  LatLng? latLngYourLoaction = const LatLng(0, 0);
  LatLng? latLng = const LatLng(0, 0);
  double get ordersPrice => double.parse(ordersModel.ordersPrice!);
  double get ordersPricedelivery =>
      double.parse(ordersModel.ordersPricedelivery!);
  double get ordersTotalprice => double.parse(ordersModel.ordersTotalprice!);
  double get coupon => (ordersPrice + ordersPricedelivery) - ordersTotalprice;

  List<Marker> markers = [];
  MapController? mapController;
  getPosition() async {
    await locationMap.check(statusRequest);
    position = await Geolocator.getCurrentPosition();
    latLngYourLoaction = LatLng(position!.latitude, position!.longitude);
    update();
    mapController!.move(latLng!, 14.5);
    statusRequest = StatusRequest.noAction;
    update();
  }

  getPositionOfOrder() async {
    await locationMap.check(statusRequest);
    latLng = LatLng(double.parse(ordersModel.addressLat!),
        double.parse(ordersModel.addressLong!));
    mapController!.move(latLng!, 14.5);
    statusRequest = StatusRequest.noAction;
    update();
  }

  initialData() async {
    // statusRequest = StatusRequest.loading;
    mapController = MapController();
    ordersModel = Get.arguments['ordersModel'];
    ordersAddress = ordersModel.ordersAddress!;
    addressCity = ordersModel.addressCity!;
    addressStreet = ordersModel.addressStreet!;
    ordersRecivetype = ordersModel.ordersRecivetype!;
    ordersId = ordersModel.ordersId!;
    latLng = LatLng(
      double.parse(ordersModel.addressLat!),
      double.parse(ordersModel.addressLong!),
    );
    await getPosition();
    await getData();
    statusRequest = StatusRequest.noAction;
    update();
  }

  getData() async {
    // statusRequest = StatusRequest.loading;
    update();
    var response = await orderDetailsData.getData(ordersId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        itemsData =
            responseData.map((e) => OrdersItemsModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    await initialData();
    super.onInit();
  }
}
