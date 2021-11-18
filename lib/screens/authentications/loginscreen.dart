import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/screens/mainappscreens/homescreen.dart';
import 'package:vegifood/screens/provider/auth_providers.dart';
import 'package:vegifood/screens/provider/location_providers.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Variables Declaration
  bool _validPhoneNumber = false;
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Visibility(
              visible: authProvider.error == 'Invalid OTP' ? true : false,
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
                  prefixText: '+92', labelText: '10 Digit Phone Number'),
              autofocus: true,
              maxLength: 10,
              keyboardType: TextInputType.phone,
              onChanged: (values) {
                if (values.length == 10) {
                  setState(() {
                    _validPhoneNumber = true;
                  });
                  (() {});
                } else {
                  setState(() {
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
                    setState(() {
                      authProvider.loading = true;
                    });
                    authProvider
                        .verifyPhone(
                            context: context,
                            number: number,
                            latitude: locationProvider.latitude,
                            longitude: locationProvider.longitude,
                            address:
                                locationProvider.selectedAddress.addressLine)
                        .then((value) {
                      phoneController.clear();
                      setState(() {
                        authProvider.loading = false; //Disabling CursoIndicator
                      });
                    });
                    Navigator.pushNamed(context, HomeScreen.id);
                  },
                  child: authProvider.loading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(_validPhoneNumber
                          ? 'CONTINUE'
                          : 'Enter Phone Number')),
            )
          ],
        ),
      ),
    );
  }
}
