import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authentication with ChangeNotifier {
  String? uid;
  String get getuid => uid!;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Login Users
  Future loginAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;
    print(user!.email);
    uid = user.uid;
    notifyListeners();
  }

  //Create Account
  Future createAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;
    print(user!.email);
    uid = user.uid;
    notifyListeners();
  }
}
