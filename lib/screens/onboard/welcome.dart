import 'package:flutter/material.dart';
import 'package:vegifood/screens/onboard/onboardingscreen.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 10,
              child: TextButton(
                onPressed: () {},
                child: Text('Skip'),
              ),
            ),
            Column(
              children: [
                Expanded(child: OnBoardingScreens()),
                Text('Welcome To Multivendor'),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {}, child: Text('Set Delivery Location')),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      text: 'Already a Customer',
                      children: [
                        TextSpan(
                            text: 'Login',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
