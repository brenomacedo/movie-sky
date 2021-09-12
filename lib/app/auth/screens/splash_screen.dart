import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 250,
          height: 250,
          child: Image.asset('lib/assets/logo.png')
        ),
      ),
      backgroundColor: Colors.black
    );
  }
}