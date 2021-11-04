import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/auth/signin.dart';
import 'package:vegifood/config/config.dart';
import 'package:vegifood/provider/product_provider.dart';
import 'package:vegifood/provider/review_cart_provider.dart';
import 'package:vegifood/provider/user_provider.dart';
import 'package:vegifood/provider/wish_list_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<ReviewCartProvider>(
            create: (context) => ReviewCartProvider()),
        ChangeNotifierProvider<WishListProvider>(
            create: (context) => WishListProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: primaryColor, scaffoldBackgroundColor: Colors.white),
        home: SignInPage(),
      ),
    );
  }
}
