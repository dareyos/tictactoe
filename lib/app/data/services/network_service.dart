import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tictactoe/app/data/models/session/session.dart';
import 'package:tictactoe/app/data/models/user_get/user_get.dart';
import 'package:tictactoe/app/data/services/storage_service.dart';
import 'package:tictactoe/core/constants.dart';

class NetService extends GetxService {
  var storageService = Get.find<StorageService>();

  Dio client = Dio(BaseOptions(baseUrl: Constants.baseUrl));

  final private_key = "".obs;

  Future<bool> isLoggedIn() async {
    String? key = await storageService.readkey();
    if (key == null) return false;

    String? userNick = await getUserNick(key: key);
    if (userNick != null) {
      private_key.value = key;
      return true;
    }

    return false;
  }

  Future<String?> getUserNick({String? key}) async {
    try {
      var response = await client.patch('/user/update',
          data: {"username": null},
          options:
              Options(headers: {'authorization': key ?? private_key.value}));

      if (response.statusCode == 200) {
        return response.data["username"];
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<Session?> writeSession(String sessionname) async {
    try {
      var response = await client.post('/session/create/$sessionname',
          options: Options(headers: {'authorization': private_key.value}));
      if (response.statusCode == 200) {
        return Session.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Session?> joinSession(String sessionId) async {
    try {
      var response = await client.patch('/session/join/$sessionId',
          options: Options(headers: {'authorization': private_key.value}));
      if (response.statusCode == 200) {
        return Session.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> registration(String username) async {
    try {
      var response = await client.post('/user/add/$username');
      var newUser = UserGet.fromJson(response.data);
      print(newUser);
      await storageService.savekey(newUser.key);
      private_key.value = newUser.key;
      print(private_key.value);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Session?> doMove(int row, int col) async {
    try {
      var response = await client.patch('/session/move',
          data: {"row": row, "col": col},
          options: Options(headers: {'authorization': private_key.value}));
      if (response.statusCode == 200) {
        return Session.fromJson(response.data);
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<Session?> startSession() async {
    try {
      var response = await client.patch('/session/start',
          options: Options(headers: {'authorization': private_key.value}));
      if (response.statusCode == 200) {
        return Session.fromJson(response.data);
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<Session> getSession(String id) async {
    try {
      var response = await client.get('/session/get/$id');
      var session = Session.fromJson(response.data);

      return session;
    } catch (e) {
      print(e);
      throw 'ERROR';
    }
  }

  Future<List<Session>> getSessions() async {
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

  Future<void> logOut() async {
    private_key.value = "";
    storageService.deletekey();
  }
}
