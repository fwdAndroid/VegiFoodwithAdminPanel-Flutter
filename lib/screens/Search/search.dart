// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/models/productmodel.dart';
import 'package:vegifood/widget/singleitemwidget.dart';

enum SinginCharacter { lowHigh, highToLow, alphabatically }

class SearchPage extends StatefulWidget {
  final List<ProductModel> searchProduct;
  SearchPage({required this.searchProduct});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = "";
  SinginCharacter _character = SinginCharacter.alphabatically;
  //Search Function
  searchItem(String query) {
    List<ProductModel> searchFood = widget.searchProduct.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Search",
          style: TextStyle(color: textColor, fontSize: 17),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Padding(
            padding: EdgeInsets.all(9),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Items'),
          ),
          Container(
            height: 53,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  fillColor: const Color(0xffc2c2c2),
                  filled: true,
                  hintText: 'Search Product Items',
                  suffixIcon: const Icon(Icons.search)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
              children: _searchItem.map((e) {
            return SingleItem(
              isBool: false,
              productImage: e.productImage,
              productName: e.productName,
              productPrice: e.productPrice,
            );
          }).toList()),
        ],
      ),
    );
  }
}
