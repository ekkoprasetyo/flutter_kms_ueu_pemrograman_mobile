import 'package:flutter_ueu_pemrograman_mobile/bindings/add_knowledge_binding.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/home_page.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/knowledge/add.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/login_page.dart';
import 'package:flutter_ueu_pemrograman_mobile/routes/route_name.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.login, page: () => const LoginPage()),
    GetPage(name: RouteName.home, page: () => HomePage()),
    GetPage(
      name: RouteName.knowledgeAdd,
      page: () => KnowledgeAddPage(),
      binding: AddKnowledgeBinding(),
    )
  ];
}
