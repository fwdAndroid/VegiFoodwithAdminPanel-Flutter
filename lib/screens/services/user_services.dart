//For All Firebase Related Services
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vegifood/screens/models/user_model.dart';

class UserServices {
  String collection = "users";
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //Create New User
  Future<void> createUser(Map<String, dynamic> valuse) async {
    String id = valuse['id'];
    await firebaseFirestore.collection(collection).doc(id).set(valuse);
  }

  //Update User
  Future<void> updateUserData(Map<String, dynamic> valuse) async {
    String id = valuse['id'];
    await firebaseFirestore.collection(collection).doc(id).update(valuse);
  }

  //Get User From ID
  Future<void> getUserByID(String id) async {
    await firebaseFirestore.collection(collection).doc(id).get().then((value) {
      if (value.data() == null) {
        return null;
      }
      return UserModel.fromSnapshot(value);
    });
  }
}
