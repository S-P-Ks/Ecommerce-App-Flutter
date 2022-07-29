import 'package:ecommapp/models/Product.dart';
import 'package:get/get.dart';

class CartController extends GetxController with StateMixin<List<Product>> {
  List<dynamic> _cartList = [].obs;
  var productsList = [];
  RxBool open = false.obs;

  void onInit() {
    super.onInit();
  }

  addProdustList(List<dynamic> p) {
    productsList = [...p];
  }

  bool isInCart(int id) {
    int idx = _cartList.indexWhere((element) => element.id == id);
    return idx >= 0 ? true : false;
  }

  toggleCart(int id) {
    int idx = _cartList.indexWhere((element) => element.id == id);
    // print(idx);
    if (idx >= 0) {
      _cartList.removeWhere((element) => element.id == id);
    } else {
      dynamic p = productsList.firstWhere((element) {
        return element.id == id;
      });
      _cartList.add(p);
    }
    print(_cartList);
    update();
  }

  int get getCartListLength {
    return [..._cartList].length;
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
    print(_cartList);
    change(getCartItems, status: RxStatus.success());
  }

  void increaseQuantity(int id) {
    int idx = _cartList.indexWhere((element) => element.id == id);
    _cartList[idx].quantity = _cartList[idx].quantity + 1;

    print(_cartList[idx].quantity);
    update();
  }

  void decreaseQuantity(int id) {
    int idx = _cartList.indexWhere((element) => element.id == id);
    _cartList[idx].quantity = _cartList[idx].quantity - 1;

    if (_cartList[idx].quantity == 0) {
      _cartList.removeAt(idx);
    }
    print(_cartList);
    print(_cartList[idx].quantity);
    update();
  }

  int idx(int id) {
    return _cartList.indexWhere((element) => element.id == id);
  }
}
