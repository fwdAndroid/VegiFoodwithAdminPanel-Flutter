import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/provider/wish_list_provider.dart';
import 'package:vegifood/screens/ReviewCart/review_cart.dart';
import 'package:vegifood/widget/counter.dart';

enum SinginCharacter { fill, outline }

class ProductOverviewPage extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  ProductOverviewPage({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  _ProductOverviewPageState createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  SinginCharacter _character = SinginCharacter.fill;
  bool wishlistBool = false;

  getWishlistBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourWishList')
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        wishlistBool = value.get('wishList');
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishlistBool();
    return Scaffold(
        bottomNavigationBar: Row(
          children: [
            bottomNavigation(
                backgroundColor: textColor,
                color: Colors.white70,
                title: "Add to WishList",
                iconData: wishlistBool == false
                    ? Icons.favorite_border_outlined
                    : Icons.favorite,
                onTap: () {
                  setState(() {
                    wishlistBool = !wishlistBool;
                  });
                  if (wishlistBool == true) {
                    wishListProvider.addWishlistData(
                        wishlistId: widget.productId,
                        wishlistName: widget.productName,
                        wishlistImage: widget.productImage,
                        wishlistPrice: widget.productPrice,
                        wishlistQuantity: 3);
                  } else {
                    wishListProvider.deleteWishList(widget.productId);
                  }
                },
                iconColor: Colors.white),
            bottomNavigation(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (xtx) => ReviewCart()));
                },
                backgroundColor: primaryColor,
                color: Colors.white70,
                title: "Go To Cart",
                iconData: Icons.shop,
                iconColor: Colors.white),
          ],
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          backgroundColor: primaryColor,
          title: Text(
            "Product OverView",
            style: TextStyle(color: textColor, fontSize: 17),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.productName),
                      subtitle: Text("\$50"),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(40),
                      child: Image.network(widget.productImage),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Available Options',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: textColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green[700],
                              ),
                              Radio(
                                activeColor: Colors.green[700],
                                value: SinginCharacter.fill,
                                groupValue: _character,
                                onChanged: (SinginCharacter? value) {
                                  setState(() {
                                    _character = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Text("\$${widget.productPrice}"),
                          Counter(
                            productName: widget.productName,
                            productImage: widget.productImage,
                            productPrice: widget.productPrice,
                            productId: widget.productId,
                          ),
                          // Container(
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 30, vertical: 10),
                          //     decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.grey),
                          //       borderRadius: BorderRadius.circular(30),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.add,
                          //           size: 15,
                          //           color: primaryColor,
                          //         ),
                          //         Text(
                          //           'ADD',
                          //           style: TextStyle(color: primaryColor),
                          //         )
                          //       ],
                          //     ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About This Product',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'In marketing, a product is an object or system made available for consumer use; it is anything that can be offered to a market to satisfy the desire or need of a customer.',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }

  //Function
  //Bottom Navigation Bar
  Widget bottomNavigation(
      {Color? iconColor,
      Color? backgroundColor,
      Color? color,
      String title = "",
      required Function() onTap,
      IconData? iconData}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 17,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(title, style: TextStyle(color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
