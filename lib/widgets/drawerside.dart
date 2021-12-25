import 'package:flutter/material.dart';
import 'package:vegifood/screens/config.dart';
import 'package:vegifood/screens/home/homescreen.dart';
import 'package:vegifood/screens/profile/myprofile.dart';
import 'package:vegifood/screens/reviewcart/reviewcart.dart';

class DrawerSide extends StatefulWidget {
  //DrawerSide({this.userProvider});
  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  @override
  Widget build(BuildContext context) {
    //  var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        // backgroundImage: NetworkImage(
                        //   userData.userImage ??
                        //       "https://s3.envato.com/files/328957910/vegi_thumb.png",
                        // ),
                        radius: 40,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(userData.userName),
                        Text(
                          'fwdkaleem@gmail.com',
                          // userData.userEmail,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
              title: "Home", icon: Icons.home_outlined,
              // onTap: () {
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => HomeScreen(),
              //     ),
              //   );
              // },
            ),
            listTile(
              icon: Icons.shop_outlined,
              title: "Review Cart",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.person_outlined,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfile(),
                  ),
                );
              },
            ),
            listTile(icon: Icons.notifications_outlined, title: "Notificatio"),
            listTile(icon: Icons.star_outline, title: "Rating & Review"),
            listTile(
              icon: Icons.favorite_outline,
              title: "Wishlist",
              //onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => WishLsit(),
              //   ),
              // );
              //  }),
            ),
            listTile(icon: Icons.copy_outlined, title: "Raise a Complaint"),
            listTile(icon: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+923352580282"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "assarbaloch5@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
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

//Functions
listTile({required IconData icon, required String title, Function()? onTap}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(icon),
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
  );
}
