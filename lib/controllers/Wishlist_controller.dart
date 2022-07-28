import 'dart:ffi';

import 'package:ecommapp/controllers/Product_Item_controller.dart';
import 'package:ecommapp/models/Product.dart';
import 'package:get/get.dart';

class WishListController extends GetxController with StateMixin<List<Product>> {
  List<dynamic> _wishlist = [].obs;
  var productsList = Get.find<ProductItemController>().getProducts;

  void init() {}

  void addProduct(int id) {
    print(id);
    Product p = productsList.firstWhere((element) => element.id == id);
    _wishlist = [..._wishlist];
    print(_wishlist);
  }

  List<dynamic> get getWishList {
    return _wishlist;
  }
}
