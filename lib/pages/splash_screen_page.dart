import 'package:flutter/material.dart';

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
