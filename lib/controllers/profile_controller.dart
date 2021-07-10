import 'package:flutter_ueu_pemrograman_mobile/models/user_data.dart';
import 'package:flutter_ueu_pemrograman_mobile/utils/user_data_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<UserData> userData = UserData().obs;

  @override
  void onInit() async {
    super.onInit();
    getUserData();
  }

  void getUserData() async {
    var _getUserData = await UserDataStorage.getAllData();
    UserData _userData = UserData.fromJson(_getUserData);
    userData.value = _userData;
  }
}
