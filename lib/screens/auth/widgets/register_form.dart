import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trueqapp/controllers/register_controller.dart';
import 'package:trueqapp/utilities/constants.dart';
import 'package:trueqapp/utilities/constomized_button.dart';
import 'package:trueqapp/utilities/my_text_field.dart';



class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
      return GetBuilder<RegisterController>(
      builder: (_) {
        return Form(
          key: _.formKey,
          child: Column(
            children: [
              MyTextField(
                hintText: "Username",
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                obscureText: false,
                text: (text) {
                  _.setUsername(text);
                },
                validator: (text) {
                  return _.validateUsername(text);
                },
              ),
              MyTextField(
                hintText: "Email",
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                obscureText: false,
                text: (text) {
                  _.setEmail(text);
                },
                validator: (text) {
                  return _.validateEmail(text);
                },
              ),
              MyTextField(
                hintText: "Phone",
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                obscureText: false,
                text: (text) {
                  _.setPhone(text);
                },
                validator: (text) {
                  return _.validatePhone(text);
                },
              ),
              MyTextField(
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                obscureText: true,
                text: (text) {
                  _.setPassword(text);
                },
                validator: (text) {
                  return _.validatePassword(text);
                },
              ),
              SizedBox(height: 30),
              CustomizedButton(
                text: "LOGIN",
                textColor: kAccentColor,
                backgroundColor: kSecondColor,
                shadowColor: Colors.black45,
                onPressed: _.submit,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  children: [
                    Text(
                      "Ya tienes cuenta? ",
                    ),
                    CupertinoButton(
                      pressedOpacity: 0.8,
                      child: Text(
                        "Registrar",
                        style: TextStyle(
                          color: kAccentColor,
                        ),
                      ),
                      onPressed: _.toLoginScreen,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );

  }
}