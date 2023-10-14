// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery/core/class/curd.dart';
import 'package:delivery/core/constant/applink.dart';

class SettingsData {
  Curd curd;
  SettingsData(this.curd);
  getData() async {
    var response = await curd.postData(AppLink.settings, {});
    return response.fold((l) => l, (r) => r);
  }
}
