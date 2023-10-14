// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery/core/class/curd.dart';
import 'package:delivery/core/constant/applink.dart';

class AcceptedOrdersData {
  Curd curd;
  AcceptedOrdersData(this.curd);

  viewOrders(String deliveryid) async {
    var response =
        await curd.postData(AppLink.acceptedorders, {"deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }

  doneOrders(String userid, String ordersid) async {
    var response = await curd
        .postData(AppLink.doneorders, {"userid": userid, "ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
