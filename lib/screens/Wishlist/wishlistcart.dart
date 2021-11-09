import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/models/productmodel.dart';
import 'package:vegifood/provider/wish_list_provider.dart';
import 'package:vegifood/widget/singleitemwidget.dart';

class WishListCart extends StatefulWidget {
  const WishListCart({Key? key}) : super(key: key);

  @override
  _WishListCartState createState() => _WishListCartState();
}

class _WishListCartState extends State<WishListCart> {
  late WishListProvider wishListProvider;

  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();

    showAlertDialog(BuildContext context, ProductModel delete) {
      Widget cancel = TextButton(
        child: Text('Cancel'),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      Widget deleteProduct = TextButton(
        child: Text('Delete'),
        onPressed: () {
          wishListProvider.deleteWishList(delete.productId);
          Navigator.pop(context);
        },
      );

      AlertDialog alert = AlertDialog(
        title: Text('AlertDialog'),
        content: Text('Would You Like To Remove This Item From WishList'),
        actions: [cancel, deleteProduct],
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'WishList',
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
        body: ListView.builder(
          itemCount: wishListProvider.getWishList.length,
          itemBuilder: (context, index) {
            ProductModel data = wishListProvider.getWishListData()[index];
            return Column(
              children: [
                SizedBox(height: 10),
                SingleItem(
                  wishlist: true,
                  isBool: true,
                  productId: data.productId,
                  productImage: data.productImage,
                  productName: data.productName,
                  productPrice: data.productPrice,
                  productQuantity: data.productQuantity,
                  onDelete: () {
                    showAlertDialog(context, data);
                  },
                ),
              ],
            );
          },
        ));
  }
}
