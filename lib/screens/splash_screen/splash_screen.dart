import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/logo_eriell.png'),
          ),
        ],
      ),
    );
  }
}
