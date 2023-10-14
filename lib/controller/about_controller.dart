import 'package:get/get.dart';

abstract class AboutController extends GetxController {}

class AboutControllerImp extends AboutController {
  
  bool promise = false;
  bool choose = false;
  bool joinus = false;
  bool aboutus = false;
  
  updateData(bool kpromise) {
    kpromise = !kpromise;
    update();
  }
 

  @override
  void onInit() {
    // info();
    super.onInit();
  }
}
