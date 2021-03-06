import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trueqapp/controllers/login_controller.dart';
import 'package:trueqapp/utilities/constants.dart';
import 'package:trueqapp/utilities/constomized_button.dart';
import 'package:trueqapp/utilities/my_text_field.dart';
import 'package:get/state_manager.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
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
                      "Todavia no tienes cuenta? ",
                    ),
                    CupertinoButton(
                      pressedOpacity: 0.8,
                      child: Text(
                        "Registrate",
                        style: TextStyle(
                          color: kAccentColor,
                        ),
                      ),
                      onPressed: _.toRegisterScreen,
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
