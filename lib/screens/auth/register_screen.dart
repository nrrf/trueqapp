import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trueqapp/controllers/register_controller.dart';
import 'package:trueqapp/screens/auth/widgets/authentication_header.dart';
import 'package:trueqapp/screens/auth/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (_) => Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AuthenticationHeader(), 
                  RegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
