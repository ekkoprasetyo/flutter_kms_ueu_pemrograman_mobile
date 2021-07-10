import 'package:flutter_ueu_pemrograman_mobile/controllers/auth_controller.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/login_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(LoginController());
  }
}
