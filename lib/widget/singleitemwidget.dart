// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/provider/review_cart_provider.dart';
import 'package:vegifood/widget/counter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingleItem extends StatefulWidget {
  //Bool Variable is Always False
  bool isBool = false;
  bool wishlist = false;
  String productName;
  String productImage;
  int productPrice;
  String productId;
  int productQuantity;
  Function() onDelete;
  SingleItem(
      {required this.wishlist,
      required this.isBool,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productId,
      required this.productQuantity,
      required this.onDelete});

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  int count = 0;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  ReviewCartProvider reviewCartProvider = ReviewCartProvider();

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Image.network(widget.productImage),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.productPrice}\$',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      widget.isBool == false
                          ? GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ListTile(
                                            title: Text('50 Gram'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: Text('500 Gram'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: Text('1 Kg'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '50\$/Gram',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Text('50 Gram')
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? Counter(
                          productName: widget.productName,
                          productImage: widget.productImage,
                          productPrice: widget.productPrice,
                          productId: widget.productId,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: widget.onDelete,
                                  child: Icon(Icons.delete,
                                      size: 30, color: Colors.black54)),
                              SizedBox(height: 5),
                              widget.wishlist == false
                                  ? Container(
                                      height: 35,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (count == 1) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "You Reached minimum limit",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                } else {
                                                  setState(() {
                                                    count--;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCart(
                                                          cartId:
                                                              widget.productId,
                                                          cartName: widget
                                                              .productName,
                                                          cartImage: widget
                                                              .productImage,
                                                          cartPrice: widget
                                                              .productPrice,
                                                          cartQuantity: count);
                                                }
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              '1',
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (count < 15) {
                                                  setState(() {
                                                    count++;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCart(
                                                          cartId:
                                                              widget.productId,
                                                          cartName: widget
                                                              .productName,
                                                          cartImage: widget
                                                              .productImage,
                                                          cartPrice: widget
                                                              .productPrice,
                                                          cartQuantity: count);
                                                }
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                            // ignore: prefer_const_constructors
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : const Divider(height: 1, color: Colors.black45)
      ],
    );
  }
}
