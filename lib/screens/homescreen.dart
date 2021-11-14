// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/dbfunctions/constructorclasses/singleproductherb.dart';
import 'package:vegifood/provider/product_provider.dart';
import 'package:vegifood/provider/user_provider.dart';
import 'package:vegifood/screens/Product/productoverview.dart';
import 'package:vegifood/screens/ReviewCart/review_cart.dart';
import 'package:vegifood/screens/Search/search.dart';
import 'package:vegifood/widget/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;
  @override
  void initState() {
    // TODO: implement initState
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fatchHerbsProductData();
    productProvider.fatchFreshProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    // productProvider.fetchHerbsProductData();
    return Scaffold(
      drawer: MyDrawer(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        title: Text(
          "Home",
          style: TextStyle(color: textColor, fontSize: 17),
        ),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: primaryColor,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctcx) => SearchPage(
                      searchProduct: productProvider.gerAllProductSearch,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.search,
                size: 24,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (xtx) => ReviewCart()));
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.shop,
                  size: 24,
                  color: textColor,
                ),
                radius: 12,
                backgroundColor: primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height * .4,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://media.istockphoto.com/photos/food-background-with-assortment-of-fresh-organic-vegetables-picture-id1203599923?b=1&k=20&m=1203599923&s=170667a&w=0&h=SxSyRNqrW8JQsyh6gCktCwcc16yX-Ymo2-I7NNTRtcA='),
              ),
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 130, bottom: 10),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Vegi',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  shadows: const [
                                    BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 10,
                                        offset: Offset(3, 3))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '30% OFF',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.green[100],
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'On all the vegetables products',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          buildHerbSingleProducts(context),
          buildFruits(context),
        ],
      ),
    );
  }

//Fruits
  Widget buildFruits(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text('Fruits Seasonings'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (xtx) => SearchPage(
                        searchProduct: productProvider.getFreshProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                productProvider.getFreshProductDataList.map((fruitsherbsdata) {
              return SingleProductHerb(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ProductOverview(
                          productId: fruitsherbsdata.productId,
                          productPrice: fruitsherbsdata.productPrice,
                          productImage: fruitsherbsdata.productImage,
                          productName: fruitsherbsdata.productName),
                    ),
                  );
                },
                productId: fruitsherbsdata.productId,
                productPrice: fruitsherbsdata.productPrice,
                productImage: fruitsherbsdata.productImage,
                productName: fruitsherbsdata.productName,
              );
            }).toList(),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

//Herbs
  Widget buildHerbSingleProducts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text('Herbs Seasonings'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (xtx) => SearchPage(
                        searchProduct: productProvider.getHerbsProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                productProvider.getHerbsProductDataList.map((herbsproductData) {
              return SingleProductHerb(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ProductOverview(
                          productId: herbsproductData.productId,
                          productPrice: herbsproductData.productPrice,
                          productImage: herbsproductData.productImage,
                          productName: herbsproductData.productName),
                    ),
                  );
                },
                productId: herbsproductData.productId,
                productPrice: herbsproductData.productPrice,
                productImage: herbsproductData.productImage,
                productName: herbsproductData.productName,
              );
            }).toList(),

            // children: [

            // ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
