import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegifood/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  
  
  // Herbs 
  List<ProductModel> herbsProductList = [];
  late ProductModel productModel;

  //Fetch Data From Firebase Using Provider
  fetchHerbsProducts() async {
    List<ProductModel> newherbsProductList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('HerbsProduct').get();

    querySnapshot.docs.forEach(
      (productIndex) {
        print(productIndex);
        productModel = ProductModel(
          productName: productIndex.get('productName'),
          productImage: productIndex.get('productImage'),
          productPrice: productIndex.get('productPrice'),
        );
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
