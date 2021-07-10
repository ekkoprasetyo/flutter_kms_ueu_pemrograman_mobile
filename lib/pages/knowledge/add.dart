import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/add_knowledge_controller.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/knowledge_controller.dart';
import 'package:get/get.dart';

class KnowledgeAddPage extends StatelessWidget {
  KnowledgeAddPage({Key? key}) : super(key: key);

  final addKnowledgeC = Get.find<AddKnowledgeController>();
  final knowledgeC = Get.find<KnowledgeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD KNOWLEDGE'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: addKnowledgeC.titleController,
                decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                    hintText: 'Please enter Knowledge Title'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: addKnowledgeC.headlineController,
                decoration: const InputDecoration(
                    labelText: 'Headline',
                    border: OutlineInputBorder(),
                    hintText: 'Please enter Knowledge Headline'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: addKnowledgeC.contentController,
                maxLines: 8,
                decoration: const InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                    hintText: 'Please enter Knowledge Content'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
