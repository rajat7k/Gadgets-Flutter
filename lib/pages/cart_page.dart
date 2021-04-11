import 'package:flutter/material.dart';
import 'package:pracise_app_2/core/store.dart';
import 'package:pracise_app_2/models/cart_model.dart';

import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: context.accentColor,
        ),
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(context.accentColor).xl4.make(),
      ),
      body: Column(
        children: [
          CartList().p12().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, _) {
              return "\$${_cart.totalPrice}".text.xl5.make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Not enough money in your wallet".text.make()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
                shape: MaterialStateProperty.all(StadiumBorder())),
            child: "Buy".text.xl2.make(),
          ).wh(95, 50)
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline_outlined),
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                    // setState(() {});
                  }),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
