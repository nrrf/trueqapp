import 'package:dio/dio.dart';
import 'package:trueqapp/api/global_api.dart';
import 'package:trueqapp/controllers/global_controller.dart';
import 'package:trueqapp/models/user.dart';
import 'package:get/get.dart';
class UserApi {
  UserApi._internal();
  static UserApi _instance = UserApi._internal();
  static UserApi get instance => _instance; 

  Future<User> aboutMe() async{
    final controller = Get.find<GlobalController>();
    final response = await GlobalApi.instance.dioRequest( 
      'users/me', 
      options: Options(headers: {"authorization":"Bearer ${controller.token}"})
    ) ;  


    return User.fromJson(response.data as Map<String,dynamic>);
  }
}