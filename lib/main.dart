import 'package:flutter/material.dart';
import 'package:pracise_app_2/pages/cart_page.dart';
import 'package:pracise_app_2/pages/home_page.dart';
import 'package:pracise_app_2/pages/login_page.dart';
import 'package:pracise_app_2/utlis/routes.dart';
import 'package:pracise_app_2/widgets/theme.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gadgets",
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
