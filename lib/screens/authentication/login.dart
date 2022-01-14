import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/providers/authentication.dart';
import 'package:vegifood/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white54),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'z',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    TextSpan(
                      text: 'ato',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      loginSheet(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      createAccountSheet(context);
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  loginSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(color: Colors.blueGrey.shade700),
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  obscureText: true,
                  controller: passController,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                MaterialButton(
                    color: Colors.red,
                    child: Text(
                      'SignIn',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () =>
                        Provider.of<Authentication>(context, listen: false)
                            .loginAccount(
                                emailController.text, passController.text)
                            .whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: HomeScreen(),
                                  type: PageTransitionType.bottomToTop));
                        }))
              ],
            ),
          );
        });
  }

  createAccountSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(color: Colors.blueGrey.shade700),
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                TextFormField(
                  obscureText: true,
                  controller: passController,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                MaterialButton(
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red,
                    onPressed: () =>
                        Provider.of<Authentication>(context, listen: false)
                            .createAccount(
                                emailController.text, passController.text)
                            .whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: HomeScreen(),
                                  type: PageTransitionType.bottomToTop));
                        }))
              ],
            ),
          );
        });
  }
}
