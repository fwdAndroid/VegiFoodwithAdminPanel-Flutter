import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/provider/review_cart_provider.dart';

class Counter extends StatefulWidget {
  String productName, productImage, productId;
  int productPrice;
  Counter(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  bool isTrue = false;

  //Get Add and quantity
  getAddandQuantity() {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (value.exists)
                {
                  setState(() {
                    count = value.get('cartQuantity');
                    isTrue = value.get('isAdd');
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return SizedBox(
      height: 25,
      width: 60,
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                   
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                      reviewCartProvider.deleteReviewCart(widget.productId);
                    } else if (count > 1) {
                      setState(() {
                        count--;
                      });
                      reviewCartProvider.addReviewCart(
                        cartId: widget.productId,
                        cartName: widget.productName,
                        cartImage: widget.productImage,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                      );
                    }

                  },
                  child: Icon(
                    Icons.remove,
                    color: Color(0xffd1ad17),
                    size: 20,
                  ),
                ),
                Text(
                  '$count',
                  style: TextStyle(
                    color: Color(0xffd1ad17),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    reviewCartProvider.updateReviewCart(
                        cartId: widget.productId,
                        cartName: widget.productName,
                        cartImage: widget.productImage,
                        cartPrice: widget.productPrice,
                        cartQuantity: count);
                  },
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Color(0xffd1ad17),
                      size: 20,
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: InkWell(
                  onTap: () {
                    setState(
                      () {
                        isTrue = true;
                      },
                    );
                    reviewCartProvider.addReviewCart(
                      cartId: widget.productId,
                      cartName: widget.productName,
                      cartImage: widget.productImage,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                    );
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(color: primaryColor),
                  )),
            ),
    );
  }
}
