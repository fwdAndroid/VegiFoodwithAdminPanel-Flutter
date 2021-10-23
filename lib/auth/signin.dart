import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:vegifood/dbfunctions/authfunctions/googleauth.dart';
import 'package:vegifood/screens/homescreen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

GoogleAuthService googleAuthService = GoogleAuthService();

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://images.pexels.com/photos/616401/pexels-photo-616401.jpeg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text('Sign in to continue'),
              ],
            ),
            const Text(
              'Vegi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                shadows: [
                  BoxShadow(
                      blurRadius: 4, color: Colors.green, offset: Offset(3, 3))
                ],
              ),
            ),
            SignInButton(Buttons.Google, text: 'Sign in With Google',
                onPressed: () async {
              googleAuthService.googleSignUp(context);
            }),
            SignInButton(Buttons.Apple,
                text: 'Sign in With Apple', onPressed: () {}),
            Text(
              'By Signing in  you are agree to our',
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            Text(
              'Terms and Privacy Policy',
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
