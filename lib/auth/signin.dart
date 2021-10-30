import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/provider/user_provider.dart';
import 'package:vegifood/screens/homescreen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  UserProvider? userProvider;
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of(context);

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
              await googleSignUp(context).then(
                (value) => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                ),
              );
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

  googleSignUp(BuildContext context) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;

      print("signed in " + user!.email.toString());
      userProvider!.addUserData(
        currentUser: user,
        userEmail: user.email!,
        userImage: user.photoURL!,
        userName: user.displayName!,
      );

      return user;
      // ignore: empty_catches
    } catch (e) {}
  }
}
