import 'package:template/presentation/feature/dashboard/controller/navigation_controller.dart';
import 'package:template/presentation/feature/home/controller/home_controller.dart';
import 'package:template/presentation/feature/reports/controller/report_controller.dart';
import 'package:template/presentation/feature/tipper/controller/tipper_controller.dart';
import 'package:template/presentation/feature/track_vehicle/controller/track_vehicle_controller.dart';
import 'package:get/get.dart';

class DashboardBindings implements Bindings {
  DashboardBindings();

  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TrackVehicleController());
    Get.lazyPut(() => TipperController());
    Get.lazyPut(() => ReportController());
  }
}
