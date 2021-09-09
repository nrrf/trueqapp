import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trueqapp/controllers/change_password_controller.dart';
import 'package:trueqapp/utilities/constants.dart';
import 'package:trueqapp/utilities/constomized_button.dart';
import 'package:trueqapp/utilities/my_text_field.dart';
import 'package:get/state_manager.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      builder: (_) {
        return Form(
          key: _.formKey,
          child: Column(
            children: [
              MyTextField(
                hintText: "Repeat Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                obscureText: true,
                text: (text) {
                  _.setRepeatPassword = text;
                },
                validator: (text) {
                  return _.validateRepeatPassword(text);
                },
              ),
              MyTextField(
                hintText: "New Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                obscureText: true,
                text: (text) {
                  _.setNewPassword = text;
                },
                validator: (text) {
                  return _.validateNewPassword(text);
                },
              ),
              SizedBox(height: 30),
              CustomizedButton(
                text: "Change Password",
                textColor: kAccentColor,
                backgroundColor: kSecondColor,
                shadowColor: Colors.black45,
                onPressed: _.submit,
              ),
            ],
          ),
        );
      },
    );
  }
}
