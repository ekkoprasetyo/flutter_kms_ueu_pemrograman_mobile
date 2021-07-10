import 'package:flutter_ueu_pemrograman_mobile/controllers/knowledge_controller.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class KnowledgeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(KnowledgeController());
    Get.put(ProfileController());
  }
}
