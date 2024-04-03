import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioProvider {
  String host = "http://192.168.74.86";
  String port = "8000";
  late Dio dio;
  Future<bool> getToken(String email, String password) async {
    try {
      var response = await Dio().post(host + ':' + port + '/api/login', data: {'email': email, 'password': password});
      print(response.data);
      if (response.statusCode == 200 && response.data != '') {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['token']);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<String?> getUser(String token) async {
    try {
      var user = await Dio().get('http://10.0.2.2:8000/api/user', options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (user.statusCode == 200 && user.data != '') {
        return json.encode(user.data);
      }
    } catch (error) {
      return null;
    }
  }

  Future<bool> registerUser(String username, String email, String password) async {
    BaseOptions options =
        new BaseOptions(receiveDataWhenStatusError: true, connectTimeout: 100 * 1000, receiveTimeout: 60 * 1000);

    dio = Dio(options);

    try {
      var user =
          await dio.post(host + ':' + port + '/api/register', data: {'name': username, 'email': email, 'password': password});
      if (user.statusCode == 200 && user.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
