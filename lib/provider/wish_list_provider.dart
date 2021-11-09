import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegifood/models/productmodel.dart';

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
        .collection('Wishlist')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
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

  /////Get...///
  List<ProductModel> newWishListProduct = [];
  getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection('Wishlist')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .get();

    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
          productId: element.get('wishlistId'),
          productImage: element.get('wishlistImage'),
          productName: element.get('wishlistName'),
          productPrice: element.get('wishlistPrice'),
          productQuantity: element.get('wishlistQuantity'));
      newList.add(productModel);
    });
    newWishListProduct = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return newWishListProduct;
  }

  ///Delete//
  deleteWishList(delete) {
    FirebaseFirestore.instance
        .collection('Wishlist')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc()
        .delete();
  }
}
