import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(onPressed: () {}, child: Icon(Icons.shop));
  }
}
