import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/models/productmodel.dart';
import 'package:vegifood/provider/wish_list_provider.dart';
import 'package:vegifood/widget/singleitemwidget.dart';

class WishLsit extends StatefulWidget {
  @override
  _WishLsitState createState() => _WishLsitState();
}

class _WishLsitState extends State<WishLsit> {
  late WishListProvider wishListProvider;
  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        wishListProvider.deleteWishtList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text("Are you devete on wishList Product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishtListData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WishList",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                wishList: true,
                isBool: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: () {
                  showAlertDialog(context, data);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
