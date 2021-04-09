import 'package:flutter/material.dart';
import 'package:pracise_app_2/models/product.dart';
import 'package:pracise_app_2/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetailPage extends StatelessWidget {
  final Item products;

  const ProductDetailPage({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${products.price}".text.color(Colors.red).bold.xl4.make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
                shape: MaterialStateProperty.all(StadiumBorder())),
            child: "Buy".text.xl2.make(),
          ).wh(110, 60)
        ],
      ).p32(),
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
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    products.name.text.xl4
                        .color(MyTheme.darkBluishColor)
                        .make(),
                    products.desc.text.xl2
                        .textStyle(context.captionStyle)
                        .make(),
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
