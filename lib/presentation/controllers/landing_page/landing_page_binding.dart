import 'package:get/get.dart';

import 'landing_page_controller.dart';

class LandingPageBinding extends Bindings {


  @override
  void dependencies() {
    Get.put(LandingPageController());
  }
}
