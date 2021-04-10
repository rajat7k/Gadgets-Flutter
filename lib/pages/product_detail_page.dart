import 'package:flutter/material.dart';
import 'package:pracise_app_2/models/product_model.dart';
import 'package:pracise_app_2/widgets/home_widgets/add_to_cart.dart';
import 'package:pracise_app_2/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetailPage extends StatelessWidget {
  final Item products;

  const ProductDetailPage({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
          "\$${products.price}".text.color(Colors.red).bold.xl4.make(),
          AddToCart(
            products: products,
          ).wh(160, 55)
        ]).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(products.id.toString()),
                    child: Image.network(products.image))
                .h40(context),
            Expanded(
                child: VxArc(
              height: 35.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(children: [
                  products.name.text.xl4.color(MyTheme.darkBluishColor).make(),
                  products.desc.text.xl2.textStyle(context.captionStyle).make(),
                  "This is dummy text.  Dolor dolore ipsum duo labore ut justo accusam et est sea, dolores dolor eos et aliquyam consetetur clita, nonumy tempor magna ipsum sadipscing rebum"
                      .text
                      .textStyle(context.captionStyle)
                      .make()
                      .px16()
                      .py4()
                ]).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
