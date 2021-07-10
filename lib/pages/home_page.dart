import 'package:flutter/material.dart';
import 'package:flutter_ueu_pemrograman_mobile/controllers/knowledge_controller.dart';
import 'package:flutter_ueu_pemrograman_mobile/models/user_data.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/home/index.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/knowledge/index.dart';
import 'package:flutter_ueu_pemrograman_mobile/pages/profile/index.dart';
import 'package:flutter_ueu_pemrograman_mobile/routes/route_name.dart';
import 'package:flutter_ueu_pemrograman_mobile/utils/user_data_storage.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final KnowledgeController knowledgeController =
      Get.put(KnowledgeController());
  late TabController tabController;
  String? name;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    init();
  }

  void init() async {
    var getUserData = await UserDataStorage.getAllData();
    UserData userData = UserData.fromJson(getUserData);

    setState(() {
      name = userData.name;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        elevation: 10,
        centerTitle: false,
        backgroundColor: GFColors.DARK,
        title: Text("Welcome, $name",
            style: const TextStyle(fontSize: 14, color: Colors.white)),
        actions: <Widget>[
          GFIconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              UserDataStorage.deleteUserDataStorage();
              Get.offNamed(RouteName.splash);
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: GFTabBarView(controller: tabController, children: <Widget>[
        IndexHomePage(),
        IndexKnowledgePage(),
        ProfilePage()
      ]),
      bottomNavigationBar: GFTabBar(
        indicatorWeight: 5,
        length: 3,
        controller: tabController,
        tabs: [
          Tab(
            icon: Icon(Icons.home),
            child: const Text(
              'Home',
            ),
          ),
          Tab(
            icon: Icon(Icons.book_rounded),
            child: const Text(
              'Knowledge',
            ),
          ),
          Tab(
            icon: Icon(Icons.person),
            child: const Text(
              'Profile',
            ),
          ),
        ],
      ),
    );
  }
}
