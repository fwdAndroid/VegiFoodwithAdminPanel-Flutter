// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vegifood/widget/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Functions
  Widget singleProduct() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
        color: Color(0xffd9dad9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
                'https://www.thespruce.com/thmb/OTlE2F8a-HP-PIWj0wIFTsRqWTs=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/herb-profile-oregano-1761786-5-5c01c4fc1b4d4d748680c261c760497e.jpg'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Fresh Basil',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '50\$/50 Gram',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 6),
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  '50 Gram',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(
                                Icons.remove,
                                color: Color(0xffd1ad17),
                                size: 20,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  color: Color(0xffd1ad17),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Color(0xffd1ad17),
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffd4d181),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        actions: const [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              child: Icon(
                Icons.search,
                size: 17,
                color: Colors.black,
              ),
              radius: 12,
              backgroundColor: Color(0xffd4d181),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: const DecorationImage(
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
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 130, bottom: 10),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                color: Color(0xffd1ad17),
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

            //Herbs
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Herb Season'),
                  Text(
                    'View All',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singleProduct(),
                  singleProduct(),
                  singleProduct(),
                  singleProduct(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Fruits Season'),
                  Text(
                    'View All',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singleProductFruit(),
                  singleProductFruit(),
                  singleProductFruit(),
                  singleProductFruit(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget singleProductFruit() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
        color: Color(0xffd9dad9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBJUrYiKaStYk6Z8F4RGBa5UEOTxt9ycchIQ&usqp=CAU'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Water Melon',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '50\$/50 Gram',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 6),
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                child: Text(
                                  '50 Gram',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(
                                Icons.remove,
                                color: Color(0xffd1ad17),
                                size: 20,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  color: Color(0xffd1ad17),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Color(0xffd1ad17),
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
