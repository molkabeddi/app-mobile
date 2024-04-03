import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DioProvider {
  String host = "http://192.168.74.86";
  String port = "8000";
  late Dio dio;
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Connection": "Keep-Alive",
      };
  postData(data, apiUrl) async {
    return await http.post(Uri.parse(apiUrl), body: jsonEncode(data), headers: _setHeaders());
  }

  Future<bool> getToken(String email, String password) async {
    try {
      http.Response response = await postData({'email': email, 'password': password}, host + ':' + port + '/api/login');
      if (response.statusCode == 200 && response.body != '') {
        var jsondata = jsonDecode(response.body.toString());
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', jsondata['token']);
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
    try {
      http.Response user =
          await postData({'name': username, 'email': email, 'password': password}, host + ':' + port + '/api/register');

      if (user.statusCode == 200 && user.body != '') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }
}
