import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vegifood/models/productmodel.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  ///Search ////.
  List<ProductModel> search = [];
  List<ProductModel> get getAllProductSearchResult {
    return search;
  }

//Provider Funcationn
  productModels(QueryDocumentSnapshot snapshot) {
    productModel = ProductModel(
        productImage: snapshot.get('productImage'),
        productName: snapshot.get('productName'),
        productPrice: snapshot.get('productPrice'));

    search.add(productModel);
  }

///////////////Herbs///////////
  List<ProductModel> herbsProductList = [];

  fetchHerbsProductData() async {
    List<ProductModel> newProductList = [];
    QuerySnapshot productValue =
        await FirebaseFirestore.instance.collection('HerbsProduct').get();

    productValue.docs.forEach(
      (element) {
        productModels(element);
        newProductList.add(productModel);
      },
    );
    herbsProductList = newProductList;
    notifyListeners();
  }

  List<ProductModel> get getFetchHerbProductsList {
    return herbsProductList;
  }

////////////////Fruiits Item List//////////////
  List<ProductModel> fruitProductlist = [];
  fetchFruitsProductData() async {
    List<ProductModel> newProductFruitList = [];
    QuerySnapshot productValue =
        await FirebaseFirestore.instance.collection('FruitsProduct').get();

    productValue.docs.forEach(
      (element) {
        productModels(element);
        newProductFruitList.add(productModel);
      },
    );
    fruitProductlist = newProductFruitList;
    notifyListeners();
  }

  List<ProductModel> get getFetchFruitProductList {
    return fruitProductlist;
  }
}
