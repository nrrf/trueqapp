import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart'; 
import 'package:get/get.dart';
class LoginController extends GetxController {
  RxString _username = ''.obs;
  RxString _password = ''.obs;
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
    _username.value = text;
  }

  void setPassword(String text) {
    _username.value = text;
  } 


  String? validateUsername(String? text){
    if(text!.trim().length > text.length){ 
      print("espacio vacio");
      return "Hay algun espacio vacio";
    }else if(text.length<3){
      print("el username debe tener al menos 3 digitos");
      return ("el username debe tener al menos 3 digitos");
    }
    return null;
  }

  String? validatePassword(String? text){
     String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp = new RegExp(pattern);

    if(text!.trim().length > text.length){ 
      print("espacio vacio");
      return "Hay algun espacio vacio";
    }else if(text.length<8){
      print("el password debe tener al menos 8 digitos");
      return("el password debe tener al menos 8 digitos");
    }else if(!regExp.hasMatch(text)){
      print("El password debe contener: 1 Upper case, 1 Lowe case, 1 Numeric Number, 1 Special Character"); 
      return("El password debe contener: 1 Upper case, 1 Lowe case, 1 Numeric Number, 1 Special Character");
    }
    return null;
  } 

  void submit(){
    final isOk = _formKey.currentState!.validate(); 
    if(isOk){
      
    }
  }

}
