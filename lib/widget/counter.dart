import 'dart:ui';

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
  int count = 1;
  bool isTrue = false;
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
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                    }

                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
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
                        cartQuantity: count);
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(color: primaryColor),
                  )),
            ),
    );
  }
}
