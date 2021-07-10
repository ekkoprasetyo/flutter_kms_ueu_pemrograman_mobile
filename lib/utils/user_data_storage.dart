import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_ueu_pemrograman_mobile/models/user_login_response.dart';

class UserDataStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyId = 'id';
  static const _keyName = 'name';
  static const _keynim = 'nim';
  static const _keyEmail = 'email';
  static const _keyTokenBearer = 'token_bearer';

  static Future setID(String id) async =>
      await _storage.write(key: _keyId, value: id);

  static Future<String?> getID() async => await _storage.read(key: _keyId);

  static Future setnim(String nim) async =>
      await _storage.write(key: _keynim, value: nim);

  static Future<String?> getnim() async => await _storage.read(key: _keynim);

  static Future setName(String name) async =>
      await _storage.write(key: _keyName, value: name);

  static Future<String?> getName() async => await _storage.read(key: _keyName);

  static Future setEmail(String email) async =>
      await _storage.write(key: _keyEmail, value: email);

  static Future<String?> getEmail() async =>
      await _storage.read(key: _keyEmail);

  static Future setTokenBearer(String tokenBearer) async =>
      await _storage.write(key: _keyTokenBearer, value: tokenBearer);

  static Future<String?> getTokenBearer() async =>
      await _storage.read(key: _keyTokenBearer);

  static void setInitialData(UserLoginResponse userLoginResponse) {
    UserDataStorage.setID(userLoginResponse.payload!.cUsersId!.toString());
    UserDataStorage.setnim(userLoginResponse.payload!.cUsersnim!);
    UserDataStorage.setName(userLoginResponse.payload!.cUsersFullname!);
    UserDataStorage.setEmail(userLoginResponse.payload!.cUsersEmail!);
    UserDataStorage.setTokenBearer(
        userLoginResponse.payload!.cUsersTokenBearer!);
  }

  static void deleteUserDataStorage() {
    _storage.delete(key: _keyId);
    _storage.delete(key: _keynim);
    _storage.delete(key: _keyName);
    _storage.delete(key: _keyEmail);
    _storage.delete(key: _keyTokenBearer);
  }

  static Future<Map<String, dynamic>> getAllData() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = await getID();
    data['nim'] = await getnim();
    data['name'] = await getName();
    data['email'] = await getEmail();
    data['tokenbearer'] = await getTokenBearer();
    return data;
  }
}
