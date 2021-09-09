

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:trueqapp/api/authentication_api.dart';

import 'global_controller.dart';
class ChangePasswordController extends GetxController{ 
  late String _password; 
  String get password => _password;

  String _repeatPassword = '';
  String get repeatPassword => _repeatPassword;  

  String _newPassword = ''; 
  String get newPassword => _newPassword;

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<FormState> get formKey => _formKey; 
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit(); 
    this._password = Get.arguments as String; 
  } 

  set setRepeatPassword(String repeatPassword){
    this._repeatPassword=repeatPassword;
  } 
  set setNewPassword(String newPassword){
    this._newPassword = newPassword;
  }

  String? validateRepeatPassword(String? text) {
    if(text != _password){
      return("Error de digitación, las contraseñas no coinciden");
    }
    return null;
  } 

  String? validateNewPassword(String? text) {
    if (text!.trim().length > text.length) {
      return "Hay algun espacio vacio";
    } else if (text.length < 8) {
      return ("el password debe tener al menos 8 digitos");
    }
    return null;
  }  

  Future<void> submit() async {
    final isOk = _formKey.currentState!.validate();
    if(isOk){
      final controller = Get.find<GlobalController>();
      final data = await AuthenticationApi.instance
          .changePassword(newPassword: _newPassword);
      if (data is int?){ 
        String message='Error no esperado, intentelo mas tarde'; 
        controller.showDialog(data.toString(), message);
      }else{
        Get.back(result: _newPassword);
      } 
    }
  }
}