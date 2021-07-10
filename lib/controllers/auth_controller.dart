import 'dart:developer';
import 'package:flutter_ueu_pemrograman_mobile/models/user_data.dart';
import 'package:flutter_ueu_pemrograman_mobile/routes/route_name.dart';
import 'package:flutter_ueu_pemrograman_mobile/utils/user_data_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    checkAuthState();
    super.onInit();
  }

  void checkAuthState() async {
    var getUserData = await UserDataStorage.getAllData();
    UserData userData = UserData.fromJson(getUserData);
    log(userData.toJson().toString());
    if (userData.tokenbearer != null) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offNamed(RouteName.home);
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offNamed(RouteName.login);
      });
    }
  }
}
