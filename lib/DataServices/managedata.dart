import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/providers/authentication.dart';

class ManageData extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future fetchData(String collection) async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collection).get();
    return querySnapshot.docs;
  }

  Future addData(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('myorders')
        .doc(Provider.of<Authentication>(context, listen: false).getuid)
        .set(data);
  }
}
