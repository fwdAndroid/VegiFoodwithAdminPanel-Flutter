// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vegifood/screens/mainappscreens/homescreen.dart';
import 'package:vegifood/screens/provider/location_providers.dart';
import 'package:vegifood/screens/services/user_services.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  late String smsOtp;
  late String verificationCode;
  String error = '';
  bool loading = false;
  UserServices userServices = UserServices();
  LocationProvider locationProvider = LocationProvider();

//Phone Number
  Future<void> verifyPhone(
      {required BuildContext context,
      required String number,
      required double latitude,
      required double longitude,
      required String address}) async {
    this.loading = true;
    notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        this.loading = false;
        notifyListeners();
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
        smsOtpDialog(context, number, latitude, longitude, address);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationCode = verificationId;
      },
    );
  }

  smsOtpDialog(BuildContext context, String number, double latitude,
      double longitude, String address) {
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
                      if (locationProvider.selectedAddress != null) {
                        updateUsers(
                            id: user!.uid,
                            phonenumber: user.phoneNumber.toString(),
                            latitude: locationProvider.latitude,
                            longitude: locationProvider.longitude,
                            address:
                                locationProvider.selectedAddress.addressLine);
                      } else {
                        // Create User Afer Successfully Login
                        createUsers(
                            id: user!.uid,
                            phonenumber: user.phoneNumber.toString(),
                            latitude: latitude,
                            longitude: longitude,
                            address: address);
                      }

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

//Add Users
  void createUsers(
      {required String id,
      required String phonenumber,
      required double latitude,
      required double longitude,
      required String address}) {
    userServices.createUser({
      'id': id,
      'number': phonenumber,
      'latitude': latitude,
      'longitude': longitude,
      'address': address
    });
    this.loading = false;
    notifyListeners();
  }

  //Update Users
  void updateUsers(
      {required String id,
      required String phonenumber,
      required double latitude,
      required double longitude,
      required String address}) {
    userServices.updateUserData({
      'id': id,
      'number': phonenumber,
      'latitude': latitude,
      'longitude': longitude,
      'address': address
    });
    this.loading = false;
    notifyListeners();
  }
}
