import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:trueqapp/controllers/global_controller.dart';
import 'package:trueqapp/screens/auth/login_screen.dart';
import 'package:trueqapp/screens/user/tab_page.dart';
import 'package:trueqapp/utilities/size_config.dart';
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
    Get.put(GlobalController());

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
              title: 'Flutter Demo',
              theme: theme.copyWith(
                scaffoldBackgroundColor: kPrimaryColor,
              ),
              home: LoginScreen(),
            );
          },
        );
      },
    );
  }
}
