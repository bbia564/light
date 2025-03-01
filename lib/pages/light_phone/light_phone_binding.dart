import 'package:get/get.dart';

import 'light_phone_logic.dart';

class LightPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
