import 'package:delivery/core/class/curd.dart';
 import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd());
 
  }
}
