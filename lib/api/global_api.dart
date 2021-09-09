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
      {dynamic data, Options? options, Request request = Request.get}) async {
    dynamic response;
    if (request == Request.get) {
      try {
        response = await _dio.get(
          path,
          options: options,
        );
      } on DioError catch (e) {
        return e.response!.statusCode;
      }
    } else if (request == Request.post) {
      try {
        response = await _dio.post(
          path,
          data: data,
          options: options,
        );
      } on DioError catch (e) {
        return e.response!.statusCode;
      }
    } else if (request == Request.put) {
      try {
        response = await _dio.put(
          path,
          data: data,
          options: options,
        );
      } on DioError catch (e) {
        return e.response!.statusCode;
      }
    } else {
      try {
        response = await _dio.delete(
          path,
          data: data,
          options: options,
        );
      } on DioError catch (e) {
        return e.response!.statusCode;
      }
    }
    return response;
  }
}

enum Request { post, get, delete, put }
