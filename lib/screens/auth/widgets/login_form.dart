import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trueqapp/controllers/login_controller.dart';
import 'package:trueqapp/utilities/constants.dart';
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
                validator: (text){
                  return _.validatePassword(text);
                },
              ),
              SizedBox(height: 30),
              CupertinoButton(
                pressedOpacity: 0.8,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: kAccentColor,
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: kSecondColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 1.0,
                        offset: Offset(8, 5),
                      )
                    ],
                  ),
                ),
                onPressed:_.submit,
              ),
            ],
          ),
        );
      },
    );
  }
}
