import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegifood/models/review_cart_modal.dart';

class ReviewCartProvider with ChangeNotifier {
  //Add User Data
  void addReviewCart({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartName": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity
    });
  }

  //Get Review Cart Data
  List<ReviewCartModel> reviewCartList = [];
  void getReviewCartData() async {
    //TO Store all data in all above list
    List<ReviewCartModel> newReviewCartlist = [];
    QuerySnapshot reviewQuerySnapshot = await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .get();

    reviewQuerySnapshot.docs.forEach((element) {
      ReviewCartModel cartModel = ReviewCartModel(
        cartId: element.get('cartId'),
        cartName: element.get('cartName'),
        cartImage: element.get('cartImage'),
        cartPrice: element.get('cartPrice'),
        cartQuantity: element.get('cartQuantity'),
      );
      newReviewCartlist.add(cartModel);
    });
    newReviewCartlist = reviewCartList;
    notifyListeners();
  }

  //Get Data From Provider
  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartList;
  }

  //To Get Specific data we use where condition
  //To Get All Data we use For Each

}
