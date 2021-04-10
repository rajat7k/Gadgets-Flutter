import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pracise_app_2/models/product.dart';
import 'package:pracise_app_2/pages/product_detail_page.dart';
import 'package:pracise_app_2/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductModle.items.length,
      itemBuilder: (context, index) {
        final products = ProductModle.items[index];
        return InkWell(
          child: ProductItem(products: products),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                        products: products,
                      ))),
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Item products;

  const ProductItem({Key key, @required this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(products.id.toString()),
          child: ProductImage(
            image: products.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            products.name.text.lg.color(context.accentColor).make(),
            products.desc.text.textStyle(context.captionStyle).make(),
            5.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${products.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: Icon(CupertinoIcons.cart),
                ).px16()
              ],
            ),
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
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
