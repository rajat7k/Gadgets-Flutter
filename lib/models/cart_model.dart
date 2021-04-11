import 'package:pracise_app_2/core/store.dart';
import 'package:pracise_app_2/models/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}
