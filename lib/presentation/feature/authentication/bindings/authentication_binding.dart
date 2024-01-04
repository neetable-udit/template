import 'package:get/instance_manager.dart';

import '../controller/authentication_controller.dart';

class AuthenticationBinding implements Bindings {
  AuthenticationBinding();

  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController());
  }
}
