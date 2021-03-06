import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:trueqapp/api/authentication_api.dart';
import 'package:trueqapp/controllers/global_controller.dart';
import 'package:trueqapp/models/token.dart';
import 'package:trueqapp/screens/auth/register_screen.dart';
import 'package:trueqapp/screens/user/profile_page.dart';
import 'package:trueqapp/tab_page.dart';

class LoginController extends GetxController {
  String _username = '';
  String _password = '';
  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<FormState> get formKey => _formKey;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // ever(
    //   _username,
    //   (_) {
    //     print(_username);
    //   },
    // );

    // ever(
    //   _password,
    //   (_) {
    //     print(_password);
    //   },
    // );
  }

  void setUsername(String text) {
    _username = text;
  }

  void setPassword(String text) {
    _password = text;
  }

  String? validateUsername(String? text) {
    if (text!.trim().length > text.length) {
      print("espacio vacio");
      return "Hay algun espacio vacio";
    } else if (text.length < 3) {
      print("el username debe tener al menos 3 digitos");
      return ("el username debe tener al menos 3 digitos");
    }
    return null;
  }

  String? validatePassword(String? text) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);

    if (text!.trim().length > text.length) {
      print("espacio vacio");
      return "Hay algun espacio vacio";
    } else if (text.length < 8) {
      print("el password debe tener al menos 8 digitos");
      return ("el password debe tener al menos 8 digitos");
    }
    // else if (!regExp.hasMatch(text)) {
    //   print(
    //       "El password debe contener: 1 Upper case, 1 Lowe case, 1 Numeric Number, 1 Special Character");
    //   return ("El password debe contener: 1 Upper case, 1 Lowe case, 1 Numeric Number, 1 Special Character");
    // }
    return null;
  }

  Future<void> submit() async {
    final isOk = _formKey.currentState!.validate();
    if (isOk) {
      final controller = Get.find<GlobalController>();
      final data = await AuthenticationApi.instance
          .login(username: _username, password: _password);
      if (data is int?) {
        String message = 'Error no esperado, intentelo mas tarde';
        if (data == 404) {
          message = "El usuario no existe";
        } else if (data == 403) {
          message = "El Password no es correcto";
        }
        controller.showDialog(data.toString(), message);
      } else {
        //print(data.data.runtimeType);
        Token token = Token.fromJson(data.data as Map<String, dynamic>);
        controller.token = token.accessToken;
        Get.offAll(
          TabPage(),
        );
      }
    }
  }

  void toRegisterScreen() {
    Get.to(
      RegisterScreen(),
      transition: Transition.cupertino,
    );
  }
}
