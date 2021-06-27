import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddKnowledgeController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController headlineController;
  late TextEditingController contentController;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    headlineController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void onClose() {
    titleController.dispose();
    headlineController.dispose();
    contentController.dispose();
    super.onClose();
  }
}
