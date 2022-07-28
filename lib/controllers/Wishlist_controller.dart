import 'dart:ffi';

import 'package:ecommapp/controllers/Product_Item_controller.dart';
import 'package:ecommapp/models/Product.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class WishListController extends GetxController {
  var _wishlist = [].obs;
  var productsList = [];

  void onInit() {
    super.onInit();
  }

  addProdustList(List<dynamic> p) {
    productsList = [...p];
  }

  bool isWishList(int id) {
    int idx = _wishlist.indexWhere((element) => element.id == id);
    return idx >= 0 ? true : false;
  }

  toogleWishlist(int id) {
    int idx = _wishlist.indexWhere((element) => element.id == id);
    // print(idx);
    if (idx >= 0) {
      _wishlist.removeWhere((element) => element.id == id);
    } else {
      dynamic p = productsList.firstWhere((element) {
        return element.id == id;
      });
      _wishlist.add(p);
    }
    update();
  }

  List<dynamic> get getWishList {
    return [..._wishlist];
  }
}
