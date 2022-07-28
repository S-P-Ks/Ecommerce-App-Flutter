import 'dart:ffi';

import 'package:ecommapp/controllers/Product_Item_controller.dart';
import 'package:ecommapp/models/Product.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  var _wishlist = [].obs;
  var productsList = Get.find<ProductItemController>().getProducts;

  void onInit() {
    super.onInit();
  }

  addProduct(int id) async {
    dynamic p = await productsList.firstWhere((element) {
      print(element.id.runtimeType);
      return element.id == id;
    });
    _wishlist.add(p);
    print(_wishlist);
  }

  List<dynamic> get getWishList {
    return [..._wishlist];
  }
}
