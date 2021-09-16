import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_sky/app/auth/stores/auth_store.dart';
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({ Key? key }) : super(key: key);

  final authStore = Modular.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image.asset('lib/assets/logo.png')
            ),
          ),
          SizedBox(height: 30),
          Observer(
            builder: (_) {
              if(authStore.status == Status.LOADING)
                return Center(
                  child: CircularProgressIndicator(color: Colors.red),
                );

              if(authStore.user == null) {
                Modular.to.navigate('/auth/login');
              } else {
                Modular.to.navigate('/movie');
              }

              return SizedBox();
            },
          )
        ],
      ),
      backgroundColor: Colors.black
    );
  }
}