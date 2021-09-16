import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_sky/app/auth/models/User.dart';
import 'package:movie_sky/app/movie/stores/index_movies_store.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {

  _AuthStore() {
    autorun((_) async {

      FirebaseAuth.instance.authStateChanges().listen((user) {
        if(user != null) {
          setUser(AppUser(id: user.uid, name: user.displayName, profilePic: user.photoURL));
        } else {
          setUser(null);
        }

        setStatus(Status.IDLE);
      });

    });
  }

  @observable
  Status status = Status.LOADING; 

  @action
  void setStatus(Status status) {
    this.status = status;
  }

  @observable
  AppUser? user;

  @action
  void setUser(AppUser? user) {
    this.user = user;
  }
  
  Future<void> login() async {

    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    
    if(googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    }

  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

}