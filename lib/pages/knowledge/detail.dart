import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/knowledge_controller.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:html/parser.dart' show parse;

class KnowledgeDetail extends StatelessWidget {
  int index;
  KnowledgeDetail({Key? key, required this.index}) : super(key: key);

  final KnowledgeController knowledgeController =
      Get.find<KnowledgeController>();

  @override
  Widget build(BuildContext context) {
    var document = parse(knowledgeController
            .knowledgeResponse.value.payload![index].content!)
        .documentElement!
        .text;
    return Scaffold(
        appBar: GFAppBar(
          elevation: 10,
          centerTitle: false,
          backgroundColor: GFColors.DARK,
          title: Text("Detail Knowledge",
              style: const TextStyle(fontSize: 14, color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  knowledgeController
                      .knowledgeResponse.value.payload![index].title!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                  knowledgeController
                      .knowledgeResponse.value.payload![index].tags!,
                  style: TextStyle(fontSize: 14, color: Colors.blue)),
              Container(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        ' By ${knowledgeController.knowledgeResponse.value.payload![index].createdBy!}',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                    Text(
                        '${knowledgeController.knowledgeResponse.value.payload![index].updateTime!}',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                  ],
                ),
              ),
              Divider(
                height: 20,
                thickness: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(document,
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
            ],
          ),
        ));
  }
}
