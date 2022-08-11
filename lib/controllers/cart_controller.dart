import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommapp/controllers/order_controller.dart';
import 'package:ecommapp/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController with StateMixin<List<Product>> {
  OrderController oc = Get.find<OrderController>();
  FirebaseFirestore FF = FirebaseFirestore.instance;

  List<dynamic> _cartList = [].obs;
  var productsList = [];
  RxBool open = true.obs;
  RxInt totalProducts = 0.obs;

  RxDouble totalPrice = 0.0.obs;

  void onInit() {
    super.onInit();
  }

  addProdustList(List<dynamic> p) {
    productsList = [...p];
    totalProducts.value = productsList.length;
  }

  bool isInCart(int id) {
    int idx = _cartList.indexWhere((element) => element.id == id);
    return idx >= 0 ? true : false;
  }

  void addOrders() {
    String key = DateTime.now().toString();
    key = key + "+" + totalPrice.value.toString();
    oc.addOrders(key, _cartList);
    _cartList = [];
    print(_cartList);
    totalPrice.value = 0;
    getCartListLength();
  }

  void getTotalPrice() {
    double t = _cartList.fold(totalPrice.value,
        (previousValue, element) => previousValue + element.attributes.price);
    totalPrice.value = t;

    // print("Total Price : $totalPrice.value");
    update();
  }

  toggleCart(int id) {
    int idx = _cartList.indexWhere((element) => element.id == id);
    // print(idx);
    if (idx >= 0) {
      _cartList.removeWhere((element) => element.id == id);
    } else {
      Product p = productsList.firstWhere(
        (element) {
          return element.id == id;
        },
      );
      _cartList.add(p);
      totalProducts.value = totalProducts.value + 1;
    }
    // print(_cartList);
    getTotalPrice();
    update();
  }

  int getCartListLength() {
    int t = [..._cartList].length;
    totalProducts.value = t;
    update();
    return totalProducts.value;
  }

  getProductById(int id) {
    return _cartList.firstWhere((element) => element.id == id);
  }

  List<Product> get getCartItems {
    return [..._cartList];
  }

  toggleIcon() {
    open.value = !open.value;
  }

  bool get isOpened {
    return open.value;
  }

  void remove(int id) {
    _cartList.removeWhere((element) => element.id == id);
    // print(_cartList);
    change(getCartItems, status: RxStatus.success());
  }

  void increaseQuantity(int id) {
    int idx = _cartList.indexWhere((element) => element.id == id);
    _cartList[idx].attributes.quantity = _cartList[idx].attributes.quantity + 1;

    // print(_cartList[idx].quantity);
    getTotalPrice();
    update();
  }

  void decreaseQuantity(int id) {
    int idx = _cartList.indexWhere((element) => element.id == id);
    _cartList[idx].attributes.quantity = _cartList[idx].attributes.quantity - 1;

    if (_cartList[idx].attributes.quantity == 0) {
      _cartList.removeAt(idx);
    }
    // print(_cartList);
    // print(_cartList[idx].quantity);
    getTotalPrice();
    update();
  }

  void orderNow() async {
    String key = DateTime.now().toString();
    print("Printling");
    print(key);
    oc.addOrders(key, _cartList);
  }

  int idx(int id) {
    return _cartList.indexWhere((element) => element.id == id);
  }
}
