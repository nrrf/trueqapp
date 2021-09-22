import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:trueqapp/api/authentication_api.dart';
import 'package:trueqapp/models/token.dart';
import 'package:trueqapp/screens/auth/login_screen.dart';
import 'package:trueqapp/tab_page.dart';
import 'package:email_validator/email_validator.dart';
import 'global_controller.dart';

class RegisterController extends GetxController {
  String _username = '';
  String _password = '';
  String _email = '';
  String _phone = '';

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<FormState> get formKey => _formKey;

  void setUsername(String text) {
    _username = text;
  }

  void setPassword(String text) {
    _password = text;
  }

  void setEmail(String text) {
    _email = text;
  }

  void setPhone(String text) {
    _phone = text;
  }

  String? validateUsername(String? text) {
    if (text!.trim().length > text.length) {
      return "Hay algun espacio vacio";
    } else if (text.length < 3) {
      return ("el username debe tener al menos 3 digitos");
    }
    return null;
  }

  String? validateEmail(String? text) {
    RegExp regex = new RegExp("r'^[^@]+@[^@]+\.[^@]+");
    if (text!.trim().length > text.length) {
      return "Hay algun espacio vacio";
    } else if (text.length < 3) {
      return ("el username debe tener al menos 3 digitos");
    } else if (!EmailValidator.validate(text)) {
      return ("No es un correo valido");
    }
    return null;
  }

  String? validatePhone(String? text) {
    // regex taked of: https://stackoverflow.com/questions/55552230/flutter-validate-a-phone-number-using-regex/56488868#56488868
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (text!.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(text)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text!.trim().length > text.length) {
      return "Hay algun espacio vacio";
    } else if (text.length < 8) {
      return ("el password debe tener al menos 8 digitos");
    }
    return null;
  }

  void toLoginScreen() {
    Get.to(
      LoginScreen(),
      transition: Transition.cupertino,
    );
  }

  Future<void> submit() async {
    final isOk = _formKey.currentState!.validate();
    if (isOk) {
      final controller = Get.find<GlobalController>();
      final data = await AuthenticationApi.instance.register(
        username: _username,
        password: _password,
        email: _email,
        phone: _phone,
      );
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
}
