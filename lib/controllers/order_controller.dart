import 'package:ecommapp/models/Product.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxMap _orders = {}.obs;

  void addOrders(String key, List<dynamic> prod) {
    print(prod);
    _orders[key] = prod;

    print(_orders);
  }

  Map<String, dynamic> get getOrder {
    return {..._orders};
  }
}
