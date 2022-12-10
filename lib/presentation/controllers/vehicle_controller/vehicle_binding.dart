import 'package:get/get.dart';
import 'package:turno_customer_application/presentation/controllers/vehicle_controller/vehicle_details_controller.dart';




class VehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VehicleDetailsController());
  }
}
