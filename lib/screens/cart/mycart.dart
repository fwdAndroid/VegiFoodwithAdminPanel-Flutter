import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vegifood/screens/home/home_screen.dart';

class MyCart extends StatefulWidget {
  var totalItems = 0;

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(context),
          headerText(),
          shippingDetails(context),
          billingData(),
          floatingActionBtn()
        ],
      ),
    );
  }

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

  Widget headerText() {
    return Column(
      children: [
        Text(
          'Your',
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
        Text(
          'Cart',
          style: TextStyle(color: Colors.grey, fontSize: 40),
        ),
      ],
    );
  }

  Widget cartData() {
    return SizedBox(
      height: 300,
    );
  }

  Widget shippingDetails(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 3)
      ], borderRadius: BorderRadius.circular(40), color: Colors.white),
      height: 130,
      width: 400,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(FontAwesomeIcons.locationArrow),
                  Container(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: Text('Police Area'))
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(EvaIcons.clock),
                  Container(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: Text('6pm - 6pm'))
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
            ],
          ),
        ],
      ),
    );
  }

  Widget billingData() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 3)
      ], borderRadius: BorderRadius.circular(40), color: Colors.white),
      height: 130,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'subTotal',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    FontAwesomeIcons.rupeeSign,
                    color: Colors.grey,
                    size: 16,
                  ),
                  Text(
                    '300',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Delivery Charges',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    FontAwesomeIcons.rupeeSign,
                    color: Colors.grey,
                    size: 16,
                  ),
                  Text(
                    '300',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Total',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    FontAwesomeIcons.rupeeSign,
                    color: Colors.grey,
                    size: 16,
                  ),
                  Text(
                    '300',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
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
                'Place Orders',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
       
      ],
    );
  }
}
