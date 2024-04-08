import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AppointementsServices {
  static String host = "http://192.168.74.86";
  static String port = "8000";
  static late Dio dio;
  static var storage = GetStorage().read("user");
  static Future<bool> add_appointement(String date, String doctor_id) async {
    BaseOptions options =
        new BaseOptions(receiveDataWhenStatusError: true, connectTimeout: 100 * 1000, receiveTimeout: 60 * 1000);

    dio = Dio(options);
    print(storage['uid']);
    try {
      var data = await dio
          .post(host + ':' + port + '/api/add_booking', data: {'doctor_id': doctor_id, 'date': date, 'user_id': storage['uid']});
      print(data.data);
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
}
