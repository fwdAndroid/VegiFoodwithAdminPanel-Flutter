import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/screens/mainappscreens/homescreen.dart';
import 'package:vegifood/screens/mainappscreens/mapscreen.dart';
import 'package:vegifood/screens/onboard/welcome.dart';
import 'package:vegifood/screens/provider/auth_providers.dart';
import 'package:vegifood/screens/provider/location_providers.dart';
import 'package:vegifood/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LocationProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        Welcome.id: (context) => Welcome(),
        SplashScreen.id: (context) => SplashScreen(),
        MapScreen.id: (context) => MapScreen(),
      },
    );
  }
}
