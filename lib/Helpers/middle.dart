import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/DataServices/managedata.dart';

class MiddleHelpers with ChangeNotifier {
  Widget favText() {
    return RichText(
      text: TextSpan(
          text: 'Favourite',
          style: TextStyle(
              shadows: [BoxShadow(color: Colors.black, blurRadius: 1)],
              fontWeight: FontWeight.w200,
              color: Colors.black,
              fontSize: 36),
          children: <TextSpan>[
            TextSpan(
              text: 'dishes',
              style: TextStyle(
                  shadows: [BoxShadow(color: Colors.grey, blurRadius: 0)],
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ]),
    );
  }

  Widget dataFav(BuildContext context, String collection) {
    return Container(
      height: 300,
      child: FutureBuilder(
        future: Provider.of<ManageData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.network(
                  'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
            );
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 320,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 5,
                                spreadRadius: 3)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 52),
                              height: 100,
                              width: 100,
                              //Image of the Product
                              child: Image.network(
                                snapshot.data[index].data()['image'],
                                fit: BoxFit.fitWidth,
                              ),
                            ),

                            //Name of the Product
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data[index].data()['name'],
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.black),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Category of the Product
                            Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text(
                                snapshot.data[index].data()['category'],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.cyan),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //Rating of the Product
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade700,
                                      ),
                                      Text(
                                        snapshot.data[index].data()['ratings'],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  //Price of the Product
                                  Padding(
                                    padding: const EdgeInsets.only(left: 28.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.rupeeSign,
                                          size: 12,
                                        ),
                                        Text(
                                          snapshot.data[index]
                                              .data()['price']
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
