import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/auth_controller.dart';

import 'package:get/get.dart';

final AuthController authController = Get.find<AuthController>();

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/logo-ueu.png',
            height: MediaQuery.of(context).size.width * 0.5,
          ),
          Column(
            children: const [
              Text(
                "KMS FASILKOM",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                "V 1.0",
                style: TextStyle(fontSize: 15),
              ),
            ],
          )
        ],
      )),
    );
  }
}
