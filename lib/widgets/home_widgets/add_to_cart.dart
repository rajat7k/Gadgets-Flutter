import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pracise_app_2/models/cart_model.dart';
import 'package:pracise_app_2/models/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item products;
  const AddToCart({Key key, this.products}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.products) ?? false;
    return ElevatedButton(
      onPressed: () {
        isInCart = isInCart.toggle();
        if (!isInCart) {
          final _product = ProductModle();
          _cart.products = _product;
          _cart.add(widget.products);
          setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.teal),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(context.canvasColor).make().p16().w40(context);
  }
}
