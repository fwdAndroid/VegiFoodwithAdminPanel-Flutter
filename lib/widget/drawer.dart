// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/provider/user_provider.dart';
import 'package:vegifood/screens/Profiles/profile.dart';
import 'package:vegifood/screens/ReviewCart/review_cart.dart';
import 'package:vegifood/screens/Wishlist/wishlistcart.dart';

class MyDrawer extends StatefulWidget {
  UserProvider userProvider;
  MyDrawer({required this.userProvider});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //Functions
  Widget listTile(
      {required IconData icon,
      required String title,
      required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, size: 24),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                        backgroundColor: Colors.yellow,
                        backgroundImage: NetworkImage(userData.userImage ??
                            "https://w7.pngwing.com/pngs/914/758/png-transparent-github-social-media-computer-icons-logo-android-github-logo-computer-wallpaper-banner.png"),
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(userData.userName),
                        Text(
                          userData.userEmail,
                          overflow: TextOverflow.ellipsis,
                        ),

                        // const Text('Welcome Guest'),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        // SizedBox(
                        //   height: 25,
                        //   child: OutlinedButton(
                        //     style: OutlinedButton.styleFrom(
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(15.0),
                        //       ),
                        //       side: const BorderSide(width: 2),
                        //     ),
                        //     // ignore: prefer_const_constructors
                        //     onPressed: () {}, child: Text('Login'),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(icon: Icons.home_outlined, title: "Home", onTap: () {}),
            listTile(
                icon: Icons.shop_outlined,
                title: "Review Cart",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ReviewCart(),
                    ),
                  );
                }),
            listTile(
              icon: Icons.person_outline,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) =>
                        Profile(userProvider: widget.userProvider),
                  ),
                );
              },
            ),
            listTile(
                icon: Icons.notifications, title: "Notification", onTap: () {}),
            listTile(
                icon: Icons.star_outline,
                title: "Rating  & Review",
                onTap: () {}),
            listTile(
                icon: Icons.favorite_outline,
                title: "Wishlist",
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (xtx) => WishLsit()));
                }),
            listTile(
                icon: Icons.copy_outlined,
                title: "Raise a complaint",
                onTap: () {}),
            listTile(
                icon: Icons.format_quote_outlined, title: "FAQs", onTap: () {}),
            Divider(
              height: 10,
              thickness: 1,
              color: textColor,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Contact Support'),
                  SizedBox(
                    height: 10,
                  ),

                  // ignore: prefer_const_literals_to_create_immutables
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('Call Us'),
                      SizedBox(
                        width: 16,
                      ),
                      Text('+923070684743'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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
