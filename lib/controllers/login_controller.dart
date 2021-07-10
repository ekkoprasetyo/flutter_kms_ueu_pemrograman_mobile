import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/models/user_login_response.dart';
import 'package:flutter_ueu_pemrograman_mobile/routes/route_name.dart';
import 'package:flutter_ueu_pemrograman_mobile/utils/environtment.dart';
import 'package:flutter_ueu_pemrograman_mobile/utils/user_data_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController nimController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;
  RxString userLoginToken = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    nimController = TextEditingController();
    passwordController = TextEditingController();
    final nim = await UserDataStorage.getnim() ?? '';
    nimController.text = nim;
  }

  void snackBarSuccess(String title, String message) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 5),
      icon: const Icon(Icons.doorbell_outlined),
      shouldIconPulse: false,
      barBlur: 20,
      backgroundColor: Colors.green[200],
    );
  }

  void snackBarFailed(String title, String message) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 5),
      icon: const Icon(Icons.doorbell_outlined),
      shouldIconPulse: false,
      barBlur: 20,
      backgroundColor: Colors.red[200],
    );
  }

  Future<UserLoginResponse> _postLogin({String? nim, String? password}) async {
    var _loginResponse = await http
        .post(
          Uri.parse(Environment.loginURL + '?nim=$nim&password=$password'),
        )
        .timeout(const Duration(seconds: 10));

    var jsonObject = json.decode(_loginResponse.body);

    UserLoginResponse _userLoginResponse =
        UserLoginResponse.fromJson(jsonObject);

    return _userLoginResponse;
  }

  void login({String? nim, String? password}) async {
    if (nim != '' && password != '') {
      try {
        isLoading.value = true;
        UserLoginResponse? userLoginResponse =
            await _postLogin(nim: nim, password: password);
        if (userLoginResponse.code == '00') {
          isLoading.value = false;
          UserDataStorage.setInitialData(userLoginResponse);
          snackBarSuccess('Login Success', "Redirecting");
          Get.offAllNamed(RouteName.home);
        } else {
          isLoading.value = false;
          snackBarFailed('Login Failed', "Please try again");
        }
      } on TimeoutException catch (_) {
        isLoading.value = false;
        snackBarFailed('Timeout', "Please try again");
      } on Error catch (_) {
        isLoading.value = false;
        snackBarFailed('Error', "Please try again");
      }
    } else {
      snackBarFailed('Attention', "NIM and Password can't be empty");
    }
  }
}
