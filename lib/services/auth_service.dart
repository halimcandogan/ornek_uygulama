import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ornekuygulama/view/home_view.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;

  // firebase zaten bize hazır methodlar sunuyor. + olarak toast eklentisiyle ekrana mesaj yazdırıyorum.

  Future<void> signIn(BuildContext context,
      {required String email, required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        navigator.pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeView(),
        ));
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }
}
