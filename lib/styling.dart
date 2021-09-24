import 'package:flutter/material.dart';
import 'package:trueqapp/utilities/size_config.dart';
import 'package:trueqapp/utilities/constants.dart';

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xFFFFF7EC);
  static const Color topBarBackgroundColor = Color(0xFFFFD974);
  static const Color selectedTabBackgroundColor = Color(0xFFFFC442);
  static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
  static const Color subTitleTextColor = Color(0xFF9F988F);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kPrimaryColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: kPrimaryColor,
    brightness: Brightness.dark,
    textTheme: darkTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline1: title,
  );

  static final TextTheme darkTextTheme = TextTheme(
    headline1: title,
    headline2: subtitle,
    headline6: cardTitle,
    subtitle2: cardDescription,
  );

  static final TextStyle title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 5 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w300,
    color: kAccentColor,
  );

  static final TextStyle subtitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 5 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle cardDescription = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 1.0 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static final TextStyle cardTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 1.5 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
