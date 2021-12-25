import 'package:flutter/material.dart';
import 'package:vegifood/screens/config.dart';

enum SinginCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  ProductOverview({required this.productName, required this.productImage});
  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SinginCharacter _character = SinginCharacter.fill;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "Add To WishList",
              iconData: Icons.favorite,
              onTap: () {
                // setState(() {
                //   wishListBool = !wishListBool;
                // });
                // if (wishListBool == true) {
                //   wishListProvider.addWishListData(
                //     wishListId: widget.productId,
                //     wishListImage: widget.productImage,
                //     wishListName: widget.productName,
                //     wishListPrice: widget.productPrice,
                //     wishListQuantity: 2,

                //   );
                // } else {
                //   wishListProvider.deleteWishtList(widget.productId);
                // }
              }),
          bonntonNavigatorBar(
              backgroundColor: primaryColor,
              color: textColor,
              iconColor: Colors.white70,
              title: "Go To Cart",
              iconData: Icons.shop_outlined,
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => ReviewCart(),
                //   ),
                // );
              }),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffd6d382),
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Product Overview",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName),
                    subtitle: Text('\$50'),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(20),
                    child: Image.network(widget.productImage),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SinginCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (SinginCharacter? value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Text('\$50'),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: primaryColor,
                              ),
                              Text(
                                "Add",
                                style: TextStyle(color: primaryColor),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bonntonNavigatorBar({
    Color? iconColor,
    Color? backgroundColor,
    Color? color,
    required String title,
    IconData? iconData,
    required Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
