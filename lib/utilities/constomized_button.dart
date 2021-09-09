import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class CustomizedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color shadowColor;
  final void Function()? onPressed;
  const CustomizedButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.backgroundColor,
      required this.shadowColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: 0.8,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 10,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontFamily: 'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 1.0,
              offset: Offset(8, 5),
            )
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}