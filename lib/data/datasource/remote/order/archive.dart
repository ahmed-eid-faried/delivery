// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery/core/class/curd.dart';
import 'package:delivery/core/constant/applink.dart';

class ArchiveOrdersData {
  Curd curd;
  ArchiveOrdersData(this.curd);

  viewOrders(String deliveryid) async {
    var response =
        await curd.postData(AppLink.archiveorders, {"deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }
}
