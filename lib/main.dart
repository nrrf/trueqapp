import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:trueqapp/screens/auth/login_screen.dart';
import '../utilities/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData.dark();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: LoginScreen(),
    );
  }
}
