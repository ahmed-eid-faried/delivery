import 'dart:async';
import 'package:delivery/controller/orders/accepted_orders_controller.dart';
import 'package:delivery/core/function/polylinemap/routingmap.dart';
import 'package:delivery/core/class/status_request.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/function/get_des_of_position.dart';
import 'package:delivery/core/services/services.dart';
import 'package:delivery/data/model/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:routing_client_dart/routing_client_dart.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class TrackingController extends GetxController {
  initialData();

  getPosition();

  refreshLocation();

  moveMap();

  getPositionOfOrder();

  doneOrders();

  callPhone();

  increaseZoom();

  decreaseZoom();

  multiPositionsFun();
}

class TrackingControllerImp extends TrackingController {
  late String? deliveryid;
  int distance = 0;
  Duration duration = const Duration(seconds: 0);
  List<RoadInstruction> instructions = [];
  LatLng? latLng = const LatLng(0, 0);
  List listOrdersModel = [];
  LocationMap locationMap = LocationMap();
  MapController? mapController;
  List<Marker> markers = [];
  List<LatLng> multiPositions = [];
  MyService myServices = Get.find();
  late OrdersModel ordersModel;
  LatLng? position = const LatLng(0, 0);
  late StreamSubscription<Position> positionSubscription;
  List<RoadLeg> roadDetailInfo = [];
  List<LatLng> routeCoordinates = [];
  StatusRequest statusRequest = StatusRequest.noAction;
  late Timer timer;
  double zoom = 14.5;

  @override
  callPhone() async {
    final Uri telUri = Uri(scheme: 'tel', path: ordersModel.usersPhone);
    await launchUrl(telUri);
    update();
  }

  @override
  decreaseZoom() {
    zoom = zoom - 0.2;
    update();
  }

  @override
  doneOrders() {
    AcceptedOrdersViewController con = Get.find();
    con.doneOrders(ordersModel.ordersUserid, ordersModel.ordersId);
    Get.toNamed(AppRoute.home);
  }

  @override
  getPosition() async {
    mapController = MapController();
    await locationMap.check(statusRequest);
    Position positionk = await Geolocator.getCurrentPosition();
    position = LatLng(positionk.latitude, positionk.longitude);
    moveMap();
    update();
    positionSubscription = Geolocator.getPositionStream().listen((event) {
      position = LatLng(event.latitude, event.longitude);
      print("position: $position");
      moveMap();
      update();
    });
  }

  @override
  getPositionOfOrder() async {
    await locationMap.check(statusRequest);
    latLng = LatLng(
      double.parse(ordersModel.addressLat!),
      double.parse(ordersModel.addressLong!),
    );
    mapController!.move(latLng!, zoom);
    statusRequest = StatusRequest.noAction;
    update();
  }

  @override
  increaseZoom() {
    zoom = zoom + 0.2;
    update();
  }

  @override
  initialData() async {
    deliveryid = myServices.pref.getString("id");
    ordersModel = Get.arguments['ordersModel'];
    latLng = LatLng(
      double.parse(ordersModel.addressLat!),
      double.parse(ordersModel.addressLong!),
    );
    multiPositionsFun();
    await getPosition();
    RoutingMap routingMap = RoutingMap();
    await routingMap.routing(routeCoordinates, position!, latLng!,
        multiPositions: multiPositions);
    roadDetailInfo = RoutingMap.roadDetailInfo;
    duration = Duration(seconds: RoutingMap.duration.toInt());
    distance = RoutingMap.distance.ceil();
    instructions = RoutingMap.instructions;
    mapController = MapController();
    markers = [
      Marker(
        key: const Key("address"),
        point: latLng!,
        width: 80,
        height: 80,
        builder: (context) => const Icon(
          Icons.location_on,
          size: 40,
          color: AppColor.primaryColor,
        ),
      ),
    ];
    refreshLocation();
    statusRequest = StatusRequest.noAction;
    update();
  }

  @override
  moveMap() {
    markers.removeWhere((element) => element.key == const Key("mylocation"));
    markers.add(
      Marker(
        key: const Key("mylocation"),
        point: position!,
        width: 80,
        height: 80,
        builder: (context) => const Icon(
          Icons.location_on,
          size: 40,
          color: AppColor.fourthColor,
        ),
      ),
    );
    mapController!.move(position!, zoom);
    statusRequest = StatusRequest.noAction;
    update();
  }

  @override
  multiPositionsFun() {
    multiPositions.clear();
    listOrdersModel = Get.arguments['listOrdersModel'] ?? [];
    for (OrdersModel item in listOrdersModel) {
      var point = LatLng(
        double.parse(item.addressLat!),
        double.parse(item.addressLong!),
      );
      multiPositions.add(point);
      markers.add(Marker(
        key: const Key("mylocation"),
        point: point,
        width: 80,
        height: 80,
        builder: (context) => const Icon(
          Icons.location_on,
          size: 40,
          color: AppColor.fourthColor,
        ),
      ));
    }
  }

  @override
  void onClose() {
    positionSubscription.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  refreshLocation() async {
    // try {
    //    await FirebaseAuth.instance.signInAnonymously();
    //   print("Signed in with temporary account.");
    // } on FirebaseAuthException catch (e) {
    //   print("=============================================");
    //   print('errors:- $e');
    //   print("=============================================");
    //   switch (e.code) {
    //     case "operation-not-allowed":
    //       print("Anonymous auth hasn't been enabled for this project.");
    //       break;
    //     default:
    //       print("Unknown error.");
    //   }
    // }
    await Future.delayed(const Duration(seconds: 2));
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      try {
        // print(
        //     '''FirebaseFirestore:- doc:-${(ordersModel.ordersId)}  "lat": ${position!.latitude.toString()},
        //   "long":${position!.longitude.toString()},
        //   "deliveryid": $deliveryid,''');
        FirebaseFirestore.instance
            .collection("delivery")
            .doc(ordersModel.ordersId)
            .set({
          "lat": position!.latitude.toString(),
          "long": position!.longitude.toString(),
          "deliveryid": deliveryid,
        });
      } catch (e) {
        print('errorsFirebaseFirestore:- $e');
      }
    });
  }

  distanceForm(double distance, {bool distanceMeter = true}) {
    int distanceKm;
    int distanceM;
    if (distanceMeter == true) {
      distanceKm = (distance / 1000).floor();
      distanceM = (distance % 1000).round();
    } else {
      distanceKm = (distance).floor();
      distanceM = ((distance % 1) * 1000).round();
    }

    String distanceString =
        '${distanceKm == 0 ? '' : '$distanceKm Km'} ${distanceKm == 0 || distanceM == 0 ? '' : ':'} ${distanceM == 0 ? '' : '$distanceM m'}';
    return distanceString;
  }

  durationFoem(double durationBySecond) {
    var duration = Duration(seconds: durationBySecond.toInt());
    String hours = duration.inHours == 0 ? '' : '${duration.inHours} h : ';
    String min =
        duration.inMinutes % 24 == 0 ? '' : '${duration.inMinutes % 24}  m : ';
    String sec =
        duration.inSeconds % 60 == 0 ? '' : '${duration.inSeconds % 60}  s';
    return '$hours$min$sec';
  }
}
