import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/DataServices/managedata.dart';
import 'package:vegifood/DataServices/mapdata.dart';
import 'package:vegifood/Helpers/footer.dart';
import 'package:vegifood/Helpers/headers.dart';
import 'package:vegifood/Helpers/middle.dart';
import 'package:vegifood/screens/splash/splash_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Headers()),
        ChangeNotifierProvider.value(
          value: MiddleHelpers(),
        ),
        ChangeNotifierProvider.value(
          value: ManageData(),
        ),
        ChangeNotifierProvider.value(
          value: Footer(),
        ),
        ChangeNotifierProvider.value(
          value: GenerateMap(),
        ),
      ],
      child: MaterialApp(
        title: "Pizzato",
        home: SplashScreen(),
      ),
    );
  }
}
