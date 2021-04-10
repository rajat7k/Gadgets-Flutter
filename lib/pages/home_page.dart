import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:pracise_app_2/utlis/routes.dart';
import 'package:pracise_app_2/widgets/home_widgets/home_drawer.dart';
import 'package:pracise_app_2/widgets/home_widgets/home_header.dart';
import 'package:pracise_app_2/widgets/home_widgets/product_list.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pracise_app_2/models/product_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final productJson = await rootBundle.loadString("assets/data/product.json");
    final decodeProductJson = jsonDecode(productJson);
    final productData = decodeProductJson["products"];
    ProductModle.items = List.from(productData)
        .map<Item>((items) => Item.fromMap(items))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        backgroundColor: Colors.teal,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        toolbarHeight: 140.0,
        title: HomeHeader(),
        backgroundColor: Colors.transparent,
      ),
      drawer: HomeDrawer(),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ProductModle.items != null && ProductModle.items.isNotEmpty)
                ProductList().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}
