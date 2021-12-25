import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegifood/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

//Manage Products
  productModels(QueryDocumentSnapshot queryDocumentSnapshot) {
    productModel = ProductModel(
        productName: queryDocumentSnapshot.get('productName'),
        productImage: queryDocumentSnapshot.get('productImage'),
        productPrice: queryDocumentSnapshot.get('productPrice'));
  }

  /////////Fruits Product/////////////
  List<ProductModel> fruitsProductList = [];

//Fetch Data From Firebase Using Provider
  fetchfruitsProducts() async {
    List<ProductModel> newfruitsProductList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('FruitsProducts').get();

    querySnapshot.docs.forEach(
      (productIndex) {
        productModels(productIndex);

        newfruitsProductList.add(productModel);
      },
    );
    fruitsProductList = newfruitsProductList;
    notifyListeners();
  }

//Return Data From Provider
  List<ProductModel> get getfruitrsProductList {
    return fruitsProductList;
  }

/////////////////////// Herbs Products..////////////
  List<ProductModel> herbsProductList = [];
//Fetch Data From Firebase Using Provider
  fetchHerbsProducts() async {
    List<ProductModel> newherbsProductList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('HerbsProduct').get();

    querySnapshot.docs.forEach(
      (productIndex) {
        print(productIndex);
        productModels(productIndex);
        newherbsProductList.add(productModel);
      },
    );
    herbsProductList = newherbsProductList;
    notifyListeners();
  }

//Return Data From Provider
  List<ProductModel> get getHerbsProductList {
    return herbsProductList;
  }
}
