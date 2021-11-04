import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier {
  //Add User Data
  void addWishlistData({
    required String wishlistId,
    required String wishlistName,
    required String wishlistImage,
    required int wishlistPrice,
    required int wishlistQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection('WishlistCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishListart")
        .doc(wishlistId)
        .set({
      "wishlistId": wishlistId,
      "wishlistName": wishlistName,
      "wishlistImage": wishlistImage,
      "wishlistPrice": wishlistPrice,
      "wishlistQuantity": wishlistQuantity,
      "wishlist": true
    });
  }
}
