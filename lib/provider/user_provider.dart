import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegifood/models/usermodel.dart';

class UserProvider with ChangeNotifier {
  //Add User Data
  void addUserData({
    required User currentUser,
    required String userName,
    required String userEmail,
    required String userImage,
  }) async {
    await FirebaseFirestore.instance
        .collection('usersData')
        .doc(currentUser.uid)
        .set({
      "userName": userName,
      "userEmail": userEmail,
      "userImage": userImage,
      "userId": currentUser.uid
    });
  }

  ///GET USER///
  late UserModel currentData;
  void getUserData() async {
    UserModel userModel;
    var valuse = await FirebaseFirestore.instance
        .collection('usersData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (valuse.exists) {
      userModel = UserModel(
        userName: valuse.get('userName'),
        userEmail: valuse.get('userEmail'),
        userImage: valuse.get('userImage'),
        userId: valuse.get('userId'),
      );

      currentData = userModel;
      notifyListeners();
    }
  }

  ///GETTER FUNCTION////
  UserModel get currentUserData {
    return currentData;
  }
}
