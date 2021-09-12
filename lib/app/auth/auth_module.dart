import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/auth/screens/auth_screen.dart';
import 'package:movie_sky/app/auth/screens/splash_screen.dart';

class AuthModule extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashScreen()),
    ChildRoute('/login', child: (_, args) => AuthScreen())
  ];

}