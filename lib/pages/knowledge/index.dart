import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/knowledge_controller.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/knowledge/list_card.dart';
import 'package:get/get.dart';

class IndexKnowledgePage extends StatelessWidget {
  IndexKnowledgePage({Key? key}) : super(key: key);

  final KnowledgeController knowledgeController =
      Get.find<KnowledgeController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: KnowledgeListCard(),
        ),
        Obx(() => (knowledgeController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : SizedBox())
      ],
    );
  }
}
