import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/knowledge_comment_controller.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/knowledge_controller.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/profile_controller.dart';
import 'package:flutter_ueu_pemrograman_mobile/models/knowledge_comment_request.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:html/parser.dart' show parse;

class KnowledgeDetail extends StatefulWidget {
  int index;
  KnowledgeDetail({Key? key, required this.index}) : super(key: key);

  @override
  State<KnowledgeDetail> createState() => _KnowledgeDetailState();
}

class _KnowledgeDetailState extends State<KnowledgeDetail> {
  final KnowledgeController knowledgeController =
      Get.find<KnowledgeController>();

  final ProfileController profileController = Get.find<ProfileController>();

  final KnowledgeCommentController knowledgeCommentController =
      Get.put(KnowledgeCommentController());

  @override
  void initState() {
    super.initState();
    knowledgeCommentController.getKnowledgeComment(
        id: knowledgeController
            .knowledgeResponse.value.payload![widget.index].id!);
  }

  @override
  Widget build(BuildContext context) {
    var document = parse(knowledgeController
            .knowledgeResponse.value.payload![widget.index].content!)
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    knowledgeController
                        .knowledgeResponse.value.payload![widget.index].title!,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                    knowledgeController
                        .knowledgeResponse.value.payload![widget.index].tags!,
                    style: TextStyle(fontSize: 14, color: Colors.blue)),
                Container(
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          ' By ${knowledgeController.knowledgeResponse.value.payload![widget.index].createdBy!}',
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                      Text(
                          '${knowledgeController.knowledgeResponse.value.payload![widget.index].updateTime!}',
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
                Divider(
                  height: 20,
                  thickness: 2,
                ),
                Text('Comments',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Obx(() => (!knowledgeCommentController.isLoading.value)
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: knowledgeCommentController
                            .knowledgeCommentResponse.value.payload!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GFListTile(
                              color: Colors.blue.shade300,
                              title: Text(
                                  '${knowledgeCommentController.knowledgeCommentResponse.value.payload![index].createdBy} - ${knowledgeCommentController.knowledgeCommentResponse.value.payload![index].updateTime}'),
                              subTitleText: knowledgeCommentController
                                  .knowledgeCommentResponse
                                  .value
                                  .payload![index]
                                  .comment,
                              icon: Icon(Icons.chat_bubble));
                        },
                      )
                    : SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    children: [
                      TextField(
                        controller:
                            knowledgeCommentController.commentController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Comment',
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            KnowledgeCommentRequest knowledgeCommentRequest =
                                KnowledgeCommentRequest(
                                    comment: knowledgeCommentController
                                        .commentController.text,
                                    id: knowledgeController.knowledgeResponse
                                        .value.payload![widget.index].id,
                                    user: profileController.userData.value.id);

                            log(knowledgeCommentRequest.toJson().toString());

                            knowledgeCommentController.postKnowledgeComment(
                                id: knowledgeController.knowledgeResponse.value
                                    .payload![widget.index].id!,
                                knowledgeCommentRequest:
                                    knowledgeCommentRequest);
                          },
                          child: Text('Send'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
