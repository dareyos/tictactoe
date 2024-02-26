import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tictactoe/models/user_get/user_get.dart';

class StorageService extends GetxService {
  
  late Box box;
  
  Future<void> writeBasicAuth(String key, String baseAuth) async {
    await box.put(key, baseAuth);
  }
  
  Future<void> write(String key, UserGet user) async {
    await box.put(key, user.toJson());
  }

  Future<StorageService> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('ttt');
    return this;
  }
}