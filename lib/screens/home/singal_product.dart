import 'package:flutter/material.dart';
import 'package:vegifood/screens/config.dart';

class SingalProduct extends StatelessWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final Function()? onTap;
  SingalProduct(
      {required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.onTap});

  @override
  build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 164,
            decoration: BoxDecoration(
                color: Color(0xffd9dad9),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 170,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(productImage),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              color: textColor, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$productPrice\$/50 Gram',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(left: 5),
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [Expanded(child: Text('50 Gram'))],
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
