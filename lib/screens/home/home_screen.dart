import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/DataServices/managedata.dart';
import 'package:vegifood/Helpers/headers.dart';
import 'package:vegifood/Helpers/middle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Headers().appBar(context),
                Headers().HeaderText(),
                Headers().headerMenu(context),
                Divider(),
                MiddleHelpers().favText(),
                MiddleHelpers().dataFav(context, 'favourite'),
                MiddleHelpers().businesssText(),
                MiddleHelpers().dataBussiness(context, 'business')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
