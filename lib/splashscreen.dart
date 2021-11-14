import 'package:flutter/material.dart';
import 'package:vegifood/screens/authentications/register.dart';
import 'package:vegifood/screens/onboard/onboardingscreen.dart';
import 'package:vegifood/screens/onboard/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Welcome())));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/logo.png'),
    );
  }
}
