import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final bool obscureText;
  final void Function(String)? text;
  final String? Function(String?) validator;

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.obscureText, 
    required this.text, 
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextFormField(   
        validator: validator,
        onChanged: text,
        obscureText: obscureText,
        cursorColor: Colors.white,
        cursorWidth: 4,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Transform.translate(
            offset: Offset(-6, 0),
            child: prefixIcon,
          ),
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          border: buildUnderlineInputBorder(Colors.white),
          enabledBorder: buildUnderlineInputBorder(Colors.white),
          focusedBorder: buildUnderlineInputBorder(Colors.white),
        ),
      ),
    );
  }
}

UnderlineInputBorder buildUnderlineInputBorder(Color color) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 2,
    ),
  );
}
