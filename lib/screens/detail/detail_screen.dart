import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vegifood/screens/cart/mycart.dart';
import 'package:vegifood/screens/home/home_screen.dart';

class DetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;
  DetailScreen({required this.queryDocumentSnapshot});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var totalItems = 0;
  var cheeseValue = 0;
  var onionValue = 0;
  var becanValue = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context),
            pizzaImage(),
            middleData(),
            footerDetails(),
            floatingActionBtn(),
          ],
        ),
      ),
    );
  }
//Functopms

  Widget appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: HomeScreen(),
                      type: PageTransitionType.bottomToTop));
            },
            icon: Icon(Icons.arrow_back_ios)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.trash)),
        )
      ],
    );
  }

  Widget pizzaImage() {
    return Center(
      child: SizedBox(
        height: 280,
        child: Container(
          child: Image.network(widget.queryDocumentSnapshot['image']),
          decoration: BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );
  }

  Widget middleData() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow.shade700,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.queryDocumentSnapshot['ratings'],
                style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Text(
                widget.queryDocumentSnapshot['name'],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.rupeeSign,
              size: 20,
              color: Colors.cyan,
            ),
            Text(
              widget.queryDocumentSnapshot['price'].toString(),
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade500),
            ),
          ],
        )
      ],
    );
  }

  Widget footerDetails() {
    return SizedBox(
      height: 240,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 5,
                      spreadRadius: 3)
                ]),
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add more stuff',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                ///Cheese
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Cheese',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade500),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(EvaIcons.minus),
                        ),
                        Text(
                          '${cheeseValue}',
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade500),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(EvaIcons.plus),
                        ),
                      ],
                    ),
                  ],
                ),
                //Onion
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Onion',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade500),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(EvaIcons.minus),
                        ),
                        Text(
                          ' ${onionValue}',
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade500),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(EvaIcons.plus),
                        ),
                      ],
                    ),
                  ],
                ),
                //Becaosn
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Becan',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade500),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(EvaIcons.minus),
                        ),
                        Text(
                          ' ${becanValue}',
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade500),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(EvaIcons.plus),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(9),
                    child: Text(
                      'S',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(9),
                    child: Text(
                      'M',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(9),
                    child: Text(
                      'L',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget floatingActionBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'Add to cart',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: MyCart(), type: PageTransitionType.bottomToTop));
              },
              child: Icon(Icons.shop, color: Colors.black),
            ),
            Positioned(
                left: 1,
                child: CircleAvatar(
                  child: Text(' ${totalItems}'),
                ))
          ],
        ),
      ],
    );
  }
}
