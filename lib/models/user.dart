// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);


import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.disabled,
        required this.phone,
        required this.iduser,
        required this.password,
        required this.email,
    });

    final bool disabled;
    final String phone;
    final String iduser;
    final String password;
    final String email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        disabled: json["disabled"],
        phone: json["phone"],
        iduser: json["iduser"],
        password: json["password"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "disabled": disabled,
        "phone": phone,
        "iduser": iduser,
        "password": password,
        "email": email,
    };
}