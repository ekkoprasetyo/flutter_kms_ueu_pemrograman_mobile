import 'package:flutter_ueu_pemrograman_mobile/controllers/add_knowledge_controller.dart';
import 'package:get/get.dart';

class AddKnowledgeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddKnowledgeController());
  }
}
