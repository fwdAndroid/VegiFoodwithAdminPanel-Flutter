// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vegifood/screens/mainappscreens/homescreen.dart';
import 'package:vegifood/screens/onboard/welcome.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_new
    new Future.delayed(
        const Duration(seconds: 3),
        () => FirebaseAuth.instance.authStateChanges().listen((User? user) {
              if (user == null) {
                Navigator.pushReplacementNamed(context, Welcome.id);
              } else {
                Navigator.pushReplacementNamed(context, HomeScreen.id);
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/logo.png'),
    );
  }
}
