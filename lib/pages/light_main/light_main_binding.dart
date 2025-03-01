import 'package:get/get.dart';

import 'light_main_logic.dart';

class LightMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightMainLogic());
  }
}
