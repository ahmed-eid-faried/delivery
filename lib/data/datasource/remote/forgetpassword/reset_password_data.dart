// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery/core/class/curd.dart';
import 'package:delivery/core/constant/applink.dart';

class ResetPasswordData {
  Curd curd;
  ResetPasswordData(this.curd);
  postData(String email, String password) async {
    var response = await curd.postData(AppLink.ressetpassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
