import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'Product.dart';

class ProductsProvider extends GetConnect {
  @override
  void onInit() {}

  Future<Response<List<dynamic>>> getProducts() =>
      get<List<dynamic>>('https://fakestoreapi.com/products');

  Future<Response<Product>> postProduct(body) =>
      post<Product>('https://fakestoreapi.com/products', body,
          decoder: (obj) => Product.fromJson(obj));
}
