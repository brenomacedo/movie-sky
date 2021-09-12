import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_sky/app/auth/components/animated_logo.dart';
import 'package:movie_sky/app/auth/components/login_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({ Key? key }) : super(key: key);

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
              bgColor: Colors.white,
              textColor: Colors.black,
              icon: FaIcon(
                FontAwesomeIcons.accessibleIcon,
                color: Colors.red
              ),
              onPressed: () {},
            ),
            SizedBox(height: 15),
            LoginButton(
              buttonText: 'Login with twitter',
              bgColor: Colors.blue[300],
              textColor: Colors.white,
              icon: FaIcon(
                FontAwesomeIcons.accessibleIcon,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            SizedBox(height: 15),
            LoginButton(
              buttonText: 'Login with github',
              bgColor: Colors.grey[700],
              textColor: Colors.white,
              icon: FaIcon(
                FontAwesomeIcons.accessibleIcon,
                color: Colors.red,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
      backgroundColor: Colors.black
    );
  }
}