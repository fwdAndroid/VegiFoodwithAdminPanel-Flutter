import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vegifood/screens/onboard/welcome.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, Welcome.id);
                },
                child: Text('Logout')),
          ),
        ],
      ),
    );
  }
}
