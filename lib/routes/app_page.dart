import 'package:flutter_ueu_pemrograman_mobile/bindings/knowledge_binding.dart';
import 'package:flutter_ueu_pemrograman_mobile/bindings/auth_binding.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/home_page.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/knowledge/add.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/login_page.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/splash_screen_page.dart';
import 'package:flutter_ueu_pemrograman_mobile/routes/route_name.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: RouteName.splash,
        page: () => SplashScreen(),
        binding: AuthBinding()),
    GetPage(name: RouteName.login, page: () => LoginPage()),
    GetPage(
        name: RouteName.home,
        page: () => HomePage(),
        binding: KnowledgeBinding()),
  ];
}
