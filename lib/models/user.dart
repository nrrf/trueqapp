// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:get/get.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class RxUser {
  final RxBool disabled;
  final RxString phone;
  final RxString iduser;
  final RxString password;
  final RxString email;

  RxUser(
      {required this.disabled,
      required this.phone,
      required this.iduser,
      required this.password,
      required this.email});
}

class User {
  late RxUser rx;
  User(
      {required bool disabled,
      required String phone,
      required String iduser,
      required String password,
      required String email}) {
    this.rx = RxUser(
      disabled: disabled.obs,
      phone: phone.obs,
      iduser: iduser.obs,
      password: password.obs,
      email: email.obs,
    );
  }
  bool get disabled => this.rx.disabled.value; 
  String get phone => this.rx.phone.value; 
  String get iduser => this.rx.iduser.value; 
  String get password => this.rx.password.value; 
  String get email => this.rx.email.value;  

  set disabled(bool disabled){
    this.rx.disabled.value = this.disabled;
  } 

  set phone(String phone){
    this.rx.phone.value = phone;
  }

  set iduser(String iduser){
    this.rx.iduser.value = iduser;
  }

  set password(String password){
    this.rx.password.value = password;
  }

  set email(String email){
    this.rx.email.value = email;
  }


  factory User.fromJson(Map<String, dynamic> json) => User(
        disabled: json["disabled"],
        phone: json["phone"],
        iduser: json["iduser"],
        password: json["password"],
        email: json["email"],
      );
}
