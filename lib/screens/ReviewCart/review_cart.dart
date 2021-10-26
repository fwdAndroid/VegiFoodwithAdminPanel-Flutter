import 'package:flutter/material.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/widget/singleitemwidget.dart';

class ReviewCart extends StatefulWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  _ReviewCartState createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ListTile(
          title: Text('Total Amount'),
          subtitle: Text(
            '\$ 170.00',
            style: TextStyle(
              color: Colors.green[800],
            ),
          ),
          trailing: Container(
            width: 160,
            color: primaryColor,
            child: MaterialButton(
              child: Text('Submit'),
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Review Cart',
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            SingleItem(
              isBool: true,
            ),
            SingleItem(isBool: true),
            SingleItem(isBool: true),
            SingleItem(isBool: true),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
