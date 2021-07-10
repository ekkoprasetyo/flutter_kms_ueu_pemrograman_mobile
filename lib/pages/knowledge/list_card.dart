import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/knowledge_controller.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:html/parser.dart' show parse;

class KnowledgeListCard extends StatelessWidget {
  KnowledgeListCard({Key? key}) : super(key: key);

  final KnowledgeController knowledgeController =
      Get.find<KnowledgeController>();

  Future _refreshKnowledge() async {
    knowledgeController.getKnowledge();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: RefreshIndicator(
                onRefresh: _refreshKnowledge,
                child: ListView.builder(
                  itemCount: knowledgeController
                      .knowledgeResponse.value.payload!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var document = parse(knowledgeController
                            .knowledgeResponse.value.payload![index].content!)
                        .documentElement!
                        .text;

                    return GFCard(
                      boxFit: BoxFit.cover,
                      title: GFListTile(
                        avatar: GFAvatar(
                          backgroundColor: Colors.white,
                          child: Image.network(
                              'https://rekreartive.com/wp-content/uploads/2018/10/Logo-Esa-Unggul-Unversitas-Esa-Unggul-PNG.png'),
                        ),
                        title: Text(
                            knowledgeController
                                .knowledgeResponse.value.payload![index].title!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )),
                        subTitle: Text(
                            knowledgeController
                                .knowledgeResponse.value.payload![index].tags!,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.blue)),
                      ),
                      content: RichText(
                        overflow: TextOverflow
                            .ellipsis, // this will help add dots after maxLines
                        maxLines: 2, // max lines after that dots comes
                        strutStyle: StrutStyle(fontSize: 12.0),
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            text: document),
                      ),
                      buttonBar: GFButtonBar(
                        children: <Widget>[
                          GFButton(
                            onPressed: () {},
                            text: 'Detail',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )),
        ));
  }
}
