import 'package:flutter/material.dart';

class Shape extends StatelessWidget {
  const Shape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash-1.png',
      width: 248,
      height: 184,
    );
  }
}
