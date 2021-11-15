// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vegifood/screens/mainappscreens/homescreen.dart';
import 'package:vegifood/screens/services/user_services.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  late String smsOtp;
  late String verificationCode;
  String error = '';
  UserServices userServices = UserServices();

//Phone Number
  Future<void> verifyPhone(BuildContext context, String number) async {
    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationCode = verificationId;
        smsOtpDialog(context, number);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationCode = verificationId;
      },
    );
  }

  smsOtpDialog(BuildContext context, String number) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text('Verification Code'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Enter 6 Digit Otp',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            content: Container(
              height: 85,
              child: TextField(
                onChanged: (val) {
                  smsOtp = val;
                },
                maxLength: 6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential phoneAuthCredential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationCode,
                              smsCode: smsOtp);

                      final User? user =
                          (await auth.signInWithCredential(phoneAuthCredential))
                              .user;
                      createUsers(
                          id: user!.uid,
                          phonenumber: user.phoneNumber.toString());
                      //Navigate to next screen
                      // ignore: unnecessary_null_comparison
                      if (user != null) {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, HomeScreen.id);
                      } else {
                        print('Authentication Failed');
                      }
                    } catch (e) {
                      error = 'Invalide OTP';
                      notifyListeners();
                      print(e.toString());
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  void createUsers({required String id, required String phonenumber}) {
    userServices.createUser({'id': id, 'number': phonenumber});
  }
}
