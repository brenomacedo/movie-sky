import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_sky/app/auth/components/animated_logo.dart';
import 'package:movie_sky/app/auth/components/login_button.dart';
import 'package:movie_sky/app/auth/stores/auth_store.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({ Key? key }) : super(key: key);

  final authStore = Modular.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedLogo(),
            SizedBox(height: 15),
            LoginButton(
              buttonText: 'Login with google',
              bgColor: Colors.red,
              textColor: Colors.white,
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.white
              ),
              onPressed: authStore.login,
            ),
            TextButton(
              child: Text('Continue without login', style: GoogleFonts.ubuntu(
                color: Colors.white
              )),
              onPressed: () {
                Modular.to.pushNamed('/movie');
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.black
    );
  }
}