import 'package:flutter/material.dart';
import 'package:trueqapp/utilities/constants.dart';

class AuthenticationHeader extends StatelessWidget { 
  const AuthenticationHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: LoginBezier(),
          child: Container(
            height: 300,
            color: kSecondColor,
          ),
        ),
        Transform.translate(
          offset: Offset(0, -200),
          child: Text(
            "TRUEQAPP",
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 48,
              fontWeight: FontWeight.w300,
              color: kAccentColor,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -220),
          child: Image.asset(
            'assets/Vector_1.png',
            width: 300,
          ),
        ),
      ],
    );
  }
}

class LoginBezier extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    final path = Path();
    path.cubicTo(size.width * 0.1, size.height * 0.72, size.width * 0.55,
        size.height * 0.47, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}