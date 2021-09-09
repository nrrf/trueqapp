import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trueqapp/controllers/global_controller.dart';
import 'package:trueqapp/api/global_api.dart';

class AuthenticationApi {
  AuthenticationApi._internal();
  static AuthenticationApi _instance = AuthenticationApi._internal();
  static AuthenticationApi get instance => _instance;

  Future<dynamic> login({
    required String username,
    required String password,
  }) async {
    final response = await GlobalApi.instance.dioRequest(
      "user/login",
      data: {
        'username': username,
        'password': password,
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
      request: Request.post,
    );
    return response;
  }

  Future<dynamic> changePassword({
    required newPassword,
  }) async {
    final controller = Get.find<GlobalController>();
    final response = await GlobalApi.instance.dioRequest(
      'user/changepassword',
      data: {
        'new_password': newPassword,
      },
      options: Options(
        headers: {"authorization": "Bearer ${controller.token}"},
      ), 
      request: Request.put,
    ); 
    return response;
  }
}
