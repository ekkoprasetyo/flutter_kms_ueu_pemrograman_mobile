import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/splash_screen_page.dart';
import 'package:flutter_ueu_pemrograman_mobile/routes/app_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/knowledge_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final KnowledgeController knowledgeController =
      Get.put(KnowledgeController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              debugShowCheckedModeBanner: false, home: SplashScreen());
        } else {
          // Loading is done, return the app:
          return GetMaterialApp(
            defaultTransition: Transition.native,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
                bodyText1:
                    GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: '/login',
            getPages: AppPages.pages,
          );
        }
      },
    );
  }
}
