// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery/core/class/curd.dart';
import 'package:delivery/core/constant/applink.dart';

class OrdersData {
  Curd curd;
  OrdersData(this.curd);

  viewOrders() async {
    var response = await curd.postData(AppLink.pendingorders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrders(String ordersid, String userid, String deliveryid,
      String deliveryaddresslat, String deliveryaddresslong) async {
    var response = await curd.postData(AppLink.approveorders, {
      "ordersid": ordersid,
      "userid": userid,
      "deliveryid": deliveryid,
      "deliveryaddresslat": deliveryaddresslat,
      "deliveryaddresslong": deliveryaddresslong,
    });
    return response.fold((l) => l, (r) => r);
  }
}
