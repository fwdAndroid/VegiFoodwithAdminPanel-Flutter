import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/screens/mainappscreens/mapscreen.dart';
import 'package:vegifood/screens/onboard/onboardingscreen.dart';
import 'package:vegifood/screens/provider/auth_providers.dart';
import 'package:vegifood/screens/provider/location_providers.dart';

class Welcome extends StatefulWidget {
  static const String id = 'welcome-screen';
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    //Variables Declaration
    bool _validPhoneNumber = false;
    TextEditingController phoneController = TextEditingController();

    //Bottom Sheet
    void showBottomSheet(context) {
      showModalBottomSheet(
          context: context,
          builder: (ctx) =>
              StatefulBuilder(builder: (context, StateSetter setter) {
                return Container(
                  child: Column(
                    children: [
                      Visibility(
                        visible:
                            authProvider.error == 'Invalid OTP' ? true : false,
                        child: Container(
                            child: Column(
                          children: [
                            Text(authProvider.error),
                          ],
                        )),
                      ),
                      const Text(
                        'Login',
                        style: TextStyle(fontSize: 25),
                      ),
                      const Text(
                        'Enter Phone Number',
                        style: TextStyle(
                          color: Colors.black12,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: phoneController,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            prefixText: '+92',
                            labelText: '10 Digit Phone Number'),
                        autofocus: true,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        onChanged: (values) {
                          if (values.length == 10) {
                            setter(() {
                              _validPhoneNumber = true;
                            });
                          } else {
                            setter(() {
                              _validPhoneNumber = false;
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AbsorbPointer(
                        absorbing: _validPhoneNumber ? false : true,
                        child: TextButton(
                            onPressed: () {
                              String number = '+92${phoneController.text}';
                              authProvider
                                  .verifyPhone(context, number)
                                  .then((value) {
                                phoneController.clear();
                              });
                            },
                            child: Text(_validPhoneNumber
                                ? 'CONTINUE'
                                : 'Enter Phone Number')),
                      )
                    ],
                  ),
                );
              }));
    }

    final locationData = Provider.of<LocationProvider>(context, listen: false);
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
                const Text('Welcome To Multivendor'),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    // ignore: prefer_const_constructors
                    onPressed: () async {
                      await locationData.getCurrentPosition();

                      if (locationData.isPermissionAllowed == true) {
                        Navigator.pushReplacementNamed(context, MapScreen.id);
                      } else {
                        print('Permisssion Failed');
                      }
                    },
                    child: const Text('Get Delivery Location')),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    showBottomSheet(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    child: RichText(
                      // ignore: prefer_const_constructors
                      text: TextSpan(
                        text: 'Already a Customer',
                        style: TextStyle(color: Colors.black),
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red))
                        ],
                      ),
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
