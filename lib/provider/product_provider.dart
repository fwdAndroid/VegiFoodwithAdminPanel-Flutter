import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vegifood/models/productmodel.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> herbsProductList = [];
  late ProductModel productModel;

  fetchHerbsProductData() async {
    List<ProductModel> newProductList = [];
    QuerySnapshot productValue =
        await FirebaseFirestore.instance.collection('HerbsProduct').get();

    productValue.docs.forEach(
      (element) {
        productModel = ProductModel(
          productImage: element.get('productImage'),
          productName: element.get('productName'),
          productPrice: element.get('productPrice'),
        );
        newProductList.add(productModel);
      },
    );
    herbsProductList = newProductList;
    notifyListeners();
  }

//Fruiits Item List
  List<ProductModel> fruitProductlist = [];

  fetchFruitsProductData() async {
    List<ProductModel> newProductFruitList = [];
    QuerySnapshot productValue =
        await FirebaseFirestore.instance.collection('FruitsProduct').get();

    productValue.docs.forEach(
      (element) {
        productModel = ProductModel(
          productImage: element.get('productImage'),
          productName: element.get('productName'),
          productPrice: element.get('productPrice'),
        );
        newProductFruitList.add(productModel);
      },
    );
    fruitProductlist = newProductFruitList;
    notifyListeners();
  }

//For Herbs
  List<ProductModel> get getFetchHerbProductsList {
    return herbsProductList;
  }

//For Fruits
  List<ProductModel> get getFetchFruitProductList {
    return fruitProductlist;
  }
}
