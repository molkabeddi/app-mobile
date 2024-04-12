import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pfa2/models/user.dart';

class AuthServices {
  String host = "http://192.168.171.86";
  String port = "8000";
  late Dio dio;
  var storage = GetStorage();
  Future<bool> login(String email, String password) async {
    BaseOptions options =
        new BaseOptions(receiveDataWhenStatusError: true, connectTimeout: 100 * 1000, receiveTimeout: 60 * 1000);

    dio = Dio(options);
    try {
      var response = await dio.post(host + ':' + port + '/api/login', data: {'email': email, 'password': password});
      if (response.statusCode == 200 && response.data != '') {
        User user = User.fromJson(response.data['user']);
        print(user.toJson());
        saveUserLocally(user);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<bool> register(String username, String email, String password) async {
    BaseOptions options =
        new BaseOptions(receiveDataWhenStatusError: true, connectTimeout: 100 * 1000, receiveTimeout: 60 * 1000);

    dio = Dio(options);

    try {
      var data =
          await dio.post(host + ':' + port + '/api/register', data: {'name': username, 'email': email, 'password': password});
      print(data.data);
      if (data.statusCode == 200 && data.data != '') {
        User user = User.fromJson(data.data['user']);
        saveUserLocally(user);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<void> saveUserLocally(User user) async {
    await storage.write("user", {
      'uid': user.id,
      'name': user.name,
      'email': user.email,
    });
    print('saving values');
  }

  logOut(BuildContext context) {
    storage.remove('role');
    storage.remove('user');
    Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }
}
