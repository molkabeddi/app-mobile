import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pfa2/models/appointement.dart';

class AppointementsServices {
  static String host = "http://192.168.110.86";
  static String port = "8000";
  static late Dio dio;
  static var storage = GetStorage().read("user");
  static Future<bool> add_appointement(String date, String doctor_id) async {
    BaseOptions options =
        new BaseOptions(receiveDataWhenStatusError: true, connectTimeout: 100 * 1000, receiveTimeout: 60 * 1000);

    dio = Dio(options);
    try {
      var data = await dio
          .post(host + ':' + port + '/api/add_booking', data: {'doctor_id': doctor_id, 'date': date, 'user_id': storage['uid']});
      if (data.statusCode == 200 && data.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  static Future<bool> update_appointement(int id, String date) async {
    BaseOptions options =
        new BaseOptions(receiveDataWhenStatusError: true, connectTimeout: 100 * 1000, receiveTimeout: 60 * 1000);

    dio = Dio(options);
    try {
      var data = await dio.put(host + ':' + port + '/api/update_booking/${id}', data: {'date': date});
      if (data.statusCode == 200 && data.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  static Future<List<Appointement>> get_appointements(String status) async {
    BaseOptions options =
        new BaseOptions(receiveDataWhenStatusError: true, connectTimeout: 100 * 1000, receiveTimeout: 60 * 1000);

    dio = Dio(options);
    try {
      var data = await dio.get(
        host + ':' + port + '/api/my_bookings/${storage['uid']}/${status}',
      );
      if (data.statusCode == 200 && data.data != '') {
        Iterable appointmentsJson = data.data['data'];
        List<Appointement> appointments =
            appointmentsJson.map((appointmentJson) => Appointement.fromJson(appointmentJson)).toList();
        return appointments;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  static Future<String> delete_appointement(int id, VoidCallback function) async {
    BaseOptions options =
        new BaseOptions(receiveDataWhenStatusError: true, connectTimeout: 100 * 1000, receiveTimeout: 60 * 1000);

    dio = Dio(options);
    try {
      var data = await dio.delete(
        host + ':' + port + '/api/delete_booking/${id}',
      );
      if (data.statusCode == 200 && data.data != '') {
        function();
        return data.data['message'];
      } else {
        function();
        return "error";
      }
    } catch (error) {
      function();
      print(error.toString());
      return "error";
    }
  }

  static Future<String> update_status(int id, VoidCallback function, String status) async {
    BaseOptions options =
        new BaseOptions(receiveDataWhenStatusError: true, connectTimeout: 100 * 1000, receiveTimeout: 60 * 1000);

    dio = Dio(options);
    try {
      var data = await dio.get(
        host + ':' + port + '/api/update_status/${id}/${status}',
      );
      print(data.data);
      if (data.statusCode == 200 && data.data != '') {
        function();
        return data.data['message'];
      } else {
        function();
        return "error";
      }
    } catch (error) {
      function();
      print(error.toString());
      return "error";
    }
  }
}
