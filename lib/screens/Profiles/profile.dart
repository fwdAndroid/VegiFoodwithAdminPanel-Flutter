import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/widget/drawer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
//Functions
  Widget listTile(IconData icon, String title) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MyDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'My Profile',
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(height: 100, color: primaryColor),
              Container(
                height: 550,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fawad',
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('fwdkaleem@gmail.com')
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: primaryColor,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    listTile(Icons.shop_outlined, 'My Orders'),
                    listTile(Icons.location_on_outlined, 'My Delivery Address'),
                    listTile(Icons.person_outline, 'Refer A Friends'),
                    listTile(Icons.file_copy_outlined, 'Terms & Condition'),
                    listTile(Icons.policy_outlined, 'Privacy Policy'),
                    listTile(Icons.addchart, 'About'),
                    listTile(Icons.exit_to_app_outlined, 'Logout'),
                  ],
                ),
              )
            ],
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              // ignore: prefer_const_constructors
              child: CircleAvatar(
                // ignore: prefer_const_constructors
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyuNFyw05KSucqjifL3PhDFrZLQh7QAS-DTw&usqp=CAU'),
                radius: 45,
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
