import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trueqapp/controllers/global_controller.dart';

class GlobalApi {
  GlobalApi._internal();
  static GlobalApi _instance = GlobalApi._internal();
  static GlobalApi get instance => _instance;

  final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/',
    ),
  );

  Future<dynamic?> dioRequest(String path,
      {dynamic data,
      Options? options,
      Request request = Request.get}) async {
    try {
      dynamic response;
      if (request == Request.get) {
        response = await _dio.get(
          path,
          options: options,
        );
      } else if (request == Request.post) {
        response = await _dio.post(
          path,
          data: data,
          options: options,
        );
      } else if (request == Request.put) {
        response = await _dio.put(
          path,
          data: data,
          options: options,
        );
      } else {
        response = await _dio.delete(
          path,
          data: data,
          options: options,
        ); 
      }
      return response;
    }on DioError catch (e) {
      return e;
    }
  }
}

enum Request { post, get, delete, put }
