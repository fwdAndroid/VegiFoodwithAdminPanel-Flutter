import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/models/review_cart_modal.dart';
import 'package:vegifood/provider/review_cart_provider.dart';
import 'package:vegifood/widget/singleitemwidget.dart';

class ReviewCart extends StatefulWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  _ReviewCartState createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
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
        body: reviewCartProvider.getReviewCartDataList.isEmpty
            ? Center(
                child: Text('No Data',
                    style: TextStyle(fontSize: 30, color: Colors.black)))
            : ListView.builder(
                itemCount: reviewCartProvider.getReviewCartDataList.length,
                itemBuilder: (context, index) {
                  ReviewCartModel data =
                      reviewCartProvider.getReviewCartDataList[index];
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      SingleItem(
                        isBool: true,
                        productId: data.cartId,
                        productImage: data.cartImage,
                        productName: data.cartName,
                        productPrice: data.cartPrice,
                        productQuantity: data.cartQuantity,
                      ),
                    ],
                  );
                },
              ));
  }
}
