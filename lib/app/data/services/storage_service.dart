import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tictactoe/app/data/models/user_get/user_get.dart';

class StorageService extends GetxService {
  // GetStorage box = GetStorage('main');

  // Future<StorageService> init() async {
  //   return this;
  // }

  // Future<void> writeUserData(UserGet data) =>
  //     box.write('userData', data.toJson());

  // Future<UserGet> readUserData() => box.read('userData');
  final storage = const FlutterSecureStorage();

  Future<String?> readkey() async {
    return await read('key');
  }

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<void> savekey(String key) async {
    await write('key', key);
  }

  Future<void> write(String key, String data) async {
    await storage.write(key: key, value: data);
  }

  Future<void> deletekey() async {
    await delete("key");
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}
