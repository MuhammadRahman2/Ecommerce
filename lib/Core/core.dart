import 'package:ecommerces/Model/CartModel.dart';
import 'package:ecommerces/Model/model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel? catalog;
  CartModel? cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    // to get
    cart!.catalog = catalog!;
  }
}
