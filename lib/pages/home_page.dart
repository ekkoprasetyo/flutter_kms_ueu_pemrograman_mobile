import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/knowledge_controller.dart';
import 'package:flutter_ueu_pemrograman_mobile/routes/route_name.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final KnowledgeController knowledgeController =
      Get.put(KnowledgeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LIST KNOWLEDGE'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Logout',
            onPressed: () {
              Get.offAllNamed(RouteName.login);
            },
          ),
        ],
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: knowledgeController.knwoledges.isEmpty
              ? const Text(
                  "No Data ..",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: knowledgeController.knwoledges.length,
                  itemBuilder: (context, i) => ListTile(
                    leading: const CircleAvatar(),
                    title: Text(knowledgeController.knwoledges[i].title),
                    subtitle: Text(knowledgeController.knwoledges[i].headline),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.red[900],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(RouteName.knowledgeAdd);
        },
        label: const Text('Add Knowledge'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
