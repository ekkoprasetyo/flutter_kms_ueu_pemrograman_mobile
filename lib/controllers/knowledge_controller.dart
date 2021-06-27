import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/models/knowledge_model.dart';
import 'package:get/get.dart';

class KnowledgeController extends GetxController {
  List<Knowledege> knwoledges = List<Knowledege>.empty().obs;

  void snackBarError(String message) {
    Get.snackbar("Error ..", message,
        duration: const Duration(seconds: 4),
        icon: const Icon(Icons.add_alert),
        shouldIconPulse: false,
        barBlur: 2,
        snackPosition: SnackPosition.BOTTOM);
  }

  void add({String? title, String? headline, String? content}) {
    if (title != '' && headline != '' && content != '') {
      knwoledges.add(
        Knowledege(
          id: DateTime.now().toString(),
          title: title!,
          headline: headline!,
          content: content!,
          author: 'Eko',
          createdAt: DateTime.now().toString(),
        ),
      );
      Get.back();
    } else {
      snackBarError("Semua data harus diisi");
    }
  }
}
