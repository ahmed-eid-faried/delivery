// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery/core/class/curd.dart';
import 'package:delivery/core/constant/applink.dart';

class VerfiyCodeForgetPasswordData {
  Curd curd;
  VerfiyCodeForgetPasswordData(this.curd);
  postData(String email, String verfiycode) async {
    var response = await curd.postData(AppLink.verifycodeforgetpassword, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
