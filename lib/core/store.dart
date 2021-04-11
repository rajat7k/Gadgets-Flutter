import 'package:pracise_app_2/models/cart_model.dart';
import 'package:pracise_app_2/models/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  ProductModle product;
  CartModel cart;

  MyStore() {
    product = ProductModle();
    cart = CartModel();

    cart.products = product;
  }
}
