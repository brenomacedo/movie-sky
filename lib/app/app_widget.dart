import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark
    ));

    return MaterialApp(
      initialRoute: '/movie/watchlist' /* /auth */,
      title: 'Movie Sky',
      debugShowCheckedModeBanner: false
    ).modular();
  }
}