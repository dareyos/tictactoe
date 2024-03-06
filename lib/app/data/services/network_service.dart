import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/data/models/session/session.dart';
import 'package:tictactoe/app/data/models/user_get/user_get.dart';
import 'package:tictactoe/app/data/services/storage_service.dart';
import 'package:tictactoe/core/constants.dart';

class NetService extends GetxService {

  var storageService = Get.find<StorageService>();

  Dio client = Dio(BaseOptions(baseUrl: Constants.baseUrl));
  //Rx<UserGet?> user = null.obs;

  //UserGet? user;

  final private_key = "".obs;

  Future<NetService> init() async {
    await readPrefs();
    return this;
  }

  Future<void> readPrefs() async {
    var userReaded = storageService.readUserData();
    print(userReaded);
  }

  Future<bool> writeSession(String sessionname) async {
    //функция чтобы создать новую игру
    try {
      var response = await client.post('/session/create/$sessionname',
          options: Options(headers: {'authorization': private_key.value}));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> registration(String username) async {
    //функция чтобы добавить игрока
    try {
      var response = await client.post('/user/add/$username');

      //print(response);
      var newUser = UserGet.fromJson(response.data);
      print(newUser);
      await storageService.writeUserData(newUser);
      //user.value = newUser;
      private_key.value = newUser.key; //сохраняем его пароль
      print(private_key.value);
      //storageService.writeUserData(user.value!);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Session> getSession(String id) async {
    //получаем конкретную сессию
    try {
      var response = await client.get('/session/get/$id');
      var session = Session.fromJson(response.data);

      return session;
    } catch (e) {
      print("GET SESSION ERROR");
      throw 'ERROR';
    }
  }

  Future<List<Session>> getSessions() async {
    //получаем список сессий
    try {
      var response = await client.get('/session/get');
      List<dynamic> sessionIds = response.data;
      List<Session> result = [];
      for (var sessionId in sessionIds) {
        var s = await getSession(sessionId);
        result.add(s);
      }
      return result;
    } catch (e) {
      print(e);
      print("GET SESSIONS ERROR");
      return [];
    }
  }


}