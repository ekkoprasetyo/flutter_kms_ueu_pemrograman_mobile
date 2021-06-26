import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/widgets/stateful_wrapper.dart';
import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  final String _versionName = 'V 1.0';
  final splashDelay = 4;

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        Duration _duration = Duration(seconds: splashDelay);
        Timer(_duration, () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage()));
        });
      },
      child: Scaffold(
        body: InkWell(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/logo-ueu.png',
                            height: 300,
                            width: 300,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                          ),
                        ],
                      )),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        const CircularProgressIndicator(),
                        Container(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(_versionName),
                                const Text('Esa Unggul University'),
                              ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
