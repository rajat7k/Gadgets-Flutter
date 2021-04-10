import 'package:pracise_app_2/models/product_model.dart';

class CartModel {
  static final cartModel = CartModel._interal();
  CartModel._interal();

  factory CartModel() => cartModel;
  //product field
  ProductModle _products;

  //collection of Ids
  final List<int> _itemIds = [];

  //Get products
  ProductModle get products => _products;

  set products(ProductModle newProduct) {
    assert(newProduct != null);
    _products = newProduct;
  }

//get item in the cart
  List<Item> get items => _itemIds.map((id) => _products.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
