import 'package:template/presentation/feature/dashboard/bindings/dashboard_bindings.dart';
import 'package:template/presentation/feature/dashboard/view/dashboard_screen.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  Future<void> validateUser() async {
    //TODO: Add Logic to get role
    //TODO: Add Logic to get verification status
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(
      const DashboardScreen(),
      binding: DashboardBindings(),
    );
  }
}
