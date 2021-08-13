import 'package:ecommerces/Pages/cartpage.dart';
import 'package:ecommerces/Pages/homepage.dart';
import 'package:ecommerces/Pages/login.dart';
import 'package:ecommerces/Widget/themes.dart';
import 'package:ecommerces/utils/routes.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shoping App",
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cart: (context) => CartPage(),
      },
    );
  }
}
