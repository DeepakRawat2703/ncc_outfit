// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ncc_outfit/pages/cart_page.dart';
import 'package:ncc_outfit/pages/register.dart';
import 'package:ncc_outfit/widgets/themes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'utils/routes.dart';

import 'widgets/drawer.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// void main() {
//
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // initialRoute: "/home",
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routes: {
        "/":(context) => MyHomePage(),
        MyRoutes.loginRoute :(context) => LoginPage(),
        MyRoutes.homeRoute :(context) => Homepage(),
        MyRoutes.cartRoute :(context) => CartPage(),
      },
    );
  }
}


