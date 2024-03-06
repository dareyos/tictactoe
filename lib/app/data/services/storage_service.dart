import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tictactoe/app/data/models/user_get/user_get.dart';

class StorageService extends GetxService {

  //late GetStorage box;

  GetStorage box = GetStorage('main');

  Future<StorageService> init() async {
    await GetStorage.init('main');
    box = GetStorage('main');
    return this;
  }

  Future<void> writeUserData(UserGet data) async {
    var jsonData = data.toJson();
    var stringData = jsonEncode(jsonData);
    await box.write('userData', stringData);
  }

  UserGet? readUserData() {
    String? stringData = box.read<String>('userData');
    if (stringData == null) return null;
    Map<String, dynamic> jsonData = jsonDecode(stringData);
    UserGet data = UserGet.fromJson(jsonData);
    print(jsonData);
    return data;
  }

  //Future<UserGet> readUserData() => box.read('userData');
}