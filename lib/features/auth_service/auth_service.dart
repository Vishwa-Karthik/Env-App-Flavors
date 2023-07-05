// ignore_for_file: use_build_context_synchronously

import 'package:environment_setup/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../screens/home.dart';

class AuthService {
  //* firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //* sign in user
  Future<void> signIn(BuildContext context, email, String password) async {
    try {
      // loading circle
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      //Stop loading screen
      Navigator.of(context).pop();

      // haptic feedback
      HapticFeedback.heavyImpact();

      // navigate to home page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //* sign up the user
  Future<void> signUp(BuildContext context, email, String password) async {
    try {
      // loading circle
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });

      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      HapticFeedback.heavyImpact();

      //Stop loading screen
      Navigator.of(context).pop();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //* sign out the user
  Future<void> signOut(BuildContext context) async {
    try {
      // loading circle
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });

      await _auth.signOut();

      HapticFeedback.heavyImpact();

      //Stop loading screen
      Navigator.of(context).pop();

      // navigate to home page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
