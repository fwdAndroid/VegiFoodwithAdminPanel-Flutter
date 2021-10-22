// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //Functions
  Widget listTile({required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 12,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xffd4d181),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    // ignore: prefer_const_constructors
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Welcome Guest'),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 25,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            side: const BorderSide(width: 2),
                          ),
                          // ignore: prefer_const_constructors
                          onPressed: () {}, child: Text('Login'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            listTile(icon: Icons.home_outlined, title: "Home"),
            listTile(icon: Icons.shop_outlined, title: "Review Cart"),
            listTile(icon: Icons.person_outline, title: "My Profile"),
            listTile(icon: Icons.notifications, title: "Notification"),
            listTile(icon: Icons.star_outline, title: "Rating  & Review"),
            listTile(icon: Icons.favorite_outline, title: "Wishlist"),
            listTile(icon: Icons.copy_outlined, title: "Raise a complaint"),
            listTile(icon: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Contact Support'),
                  const SizedBox(
                    height: 10,
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('Call Us'),
                      Text('+923070684743'),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('Mail Us:'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('+923070684743'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
