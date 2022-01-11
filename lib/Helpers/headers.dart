import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vegifood/DataServices/mapdata.dart';

class Headers with ChangeNotifier {
  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.userAlt),
          ),
          Row(
            children: [
              Icon(FontAwesomeIcons.locationArrow),
              Text(
                finalAddress,
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.search,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget HeaderText() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      constraints: BoxConstraints(
        maxWidth: 212,
      ),
      child: RichText(
        text: TextSpan(
            text: 'What would you like',
            style: TextStyle(
                fontWeight: FontWeight.w200, color: Colors.black, fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                text: 'to eat?',
                style: TextStyle(
                    fontSize: 46,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ]),
      ),
    );
  }

  Widget headerMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.redAccent, blurRadius: 15),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  color: Colors.grey.shade100),
              height: 40,
              width: 100,
              child: Center(
                child: Text(
                  'All Food',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          //Pizza
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.lightBlueAccent, blurRadius: 15),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  color: Colors.grey.shade100),
              height: 40,
              width: 100,
              child: Center(
                child: Text(
                  'Pizza',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          //Pasta
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.lightBlueAccent, blurRadius: 15),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  color: Colors.grey.shade100),
              height: 40,
              width: 100,
              child: Center(
                child: Text(
                  'Pasta',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
