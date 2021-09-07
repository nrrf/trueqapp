import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trueqapp/controllers/login_controller.dart';
import 'package:trueqapp/screens/auth/widgets/login_form.dart';
import 'package:trueqapp/screens/auth/widgets/login_header.dart';

import 'package:trueqapp/utilities/constants.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LoginHeader(),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
