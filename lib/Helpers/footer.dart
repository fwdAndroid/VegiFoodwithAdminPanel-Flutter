import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vegifood/screens/cart/mycart.dart';
import 'package:vegifood/screens/home/home_screen.dart';

class Footer extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  child: MyCart(), type: PageTransitionType.bottomToTop));
        },
        child: Icon(Icons.shop));
  }
}
