import 'package:delivery/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetpasswordController extends GetxController {
  successResetpassword();
  goToLogin();
}

class SuccessResetpasswordControllerImp extends SuccessResetpasswordController {
  @override
  successResetpassword() {}

  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
