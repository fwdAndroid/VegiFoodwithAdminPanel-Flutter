import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vegifood/models/productmodel.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
      productQuantity: element.get("productQuantity"),
    );
    search.add(productModel);
  }

  /////////////// herbsProduct ///////////////////////////////
  List<ProductModel> herbsProductList = [];

  fatchHerbsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();

    value.docs.forEach(
      (element) {
        productModels(element);

        newList.add(productModel);
      },
    );
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

//////////////// Fresh Product ///////////////////////////////////////
  List<ProductModel> freshProductList = [];

  fatchFreshProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FruitsProduct").get();

    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    freshProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFreshProductDataList {
    return freshProductList;
  }

//////////////// Root Product ///////////////////////////////////////

  /////////////////// Search Return ////////////
  List<ProductModel> get gerAllProductSearch {
    return search;
  }
}
