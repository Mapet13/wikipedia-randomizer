import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  static const pathToLogo = 'assets/logo.png';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      pathToLogo,
      width: 600,
      height: 240,
      fit: BoxFit.scaleDown,
    );
  }
}
