import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommapp/controllers/Wishlist_controller.dart';
import 'package:ecommapp/controllers/cart_controller.dart';
import 'package:ecommapp/models/category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/Product.dart';
import '../models/category.dart';
import '../models/productsProvider.dart';

class ProductItemController extends GetxController
    with StateMixin<List<dynamic>> {
  final ProductsProvider productsProvider;
  User? user;
  var getStorage = GetStorage();
  bool showAll = true;

  ProductItemController({required this.productsProvider});

  WishListController wc = Get.find<WishListController>();
  CartController cc = Get.find<CartController>();

  List<dynamic> _products = [].obs;
  List<dynamic> _categories = [].obs;

  List<Product> get getProducts {
    if (showAll) {
      return [..._products];
    }
    List<Product> pl = [];
    checkBoxed.asMap().forEach((key, value) {
      if (value == true) {
        for (Product p in _products) {
          if (p.attributes.category.data.id == key + 1) {
            pl.add(p);
          }
        }
      }
    });

    return pl;
  }

  List<Categ> get getCategories {
    return [..._categories];
  }

  List<bool> checkBoxed = [];

  @override
  void onInit() {
    getAllCategories();
    getAllProducts();
    print("calling");

    // getUserInfo();
    super.onInit();
  }

  void getAllCategories() async {
    await productsProvider.getCategories().then((val) {
      List<dynamic> categories = Categories.fromJson(json.decode(val)).data;
      print(categories);
      checkBoxed = [...List.filled(categories.length, false)];
      print(checkBoxed);
      _categories = [...categories];
    });
  }

  void changeCheckBox(int idx) {
    checkBoxed[idx] = !checkBoxed[idx];
    print(checkBoxed);

    bool t = false;

    for (bool f in checkBoxed) {
      if (f == true) {
        t = false;
        break;
      } else {
        t = true;
      }
    }

    showAll = t;

    // print(getProducts);
    change(getProducts, status: RxStatus.success());

    update();
  }

  void showAllProducts() {
    showAll = !showAll;
    checkBoxed.fillRange(0, checkBoxed.length, false);
    update();
  }

  void getAllProducts() async {
    await productsProvider.getProducts().then(
      (value) {
        // print(pr);
        // pr.map((e) => print("e"));
        Products p = productsFromJson(value.body);
        print(p);
        List<dynamic> pr = p.data;
        _products = [...pr];
        wc.addProdustList(_products);
        cc.addProdustList(_products);
        change(getProducts, status: RxStatus.success());
      },
    ).catchError((err) {
      print(err);
      change(
        err,
        status: RxStatus.error(
          err.toString(),
        ),
      );
    });
  }
}
