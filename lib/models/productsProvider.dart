import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'Product.dart';

class ProductsProvider extends GetConnect {
  @override
  void onInit() {}

  getProducts() async {
    http.Response response = await http.get(
      Uri.tryParse('http://192.168.56.1:1337/api/products?populate=category')!,
      headers: {
        'Content-Type': 'application/json',
        "Authorization":
            "Bearer eb7213a31381c24c04ac2a85d08963dfbb64be18c79b914b4a2f4b6f714230c95d87cf86a52221c20391d1c77af6c14b514327a6967343a6205bd948cbf8c589c3a57f5709041530176084073979ac0f5ff250b767f34afee0dc327b62e6772eba9f895a03da37a87e4208ae08113a3552199cf1bbea5599699a6fea4ccfbca6"
      },
    );

    // print(response.data);
    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      return response;
    } else {
      print("Some");
    }
  }

  getCategories() async {
    http.Response response = await http.get(
      Uri.tryParse('http://192.168.56.1:1337/api/categories')!,
      headers: {
        'Content-Type': 'application/json',
        "Authorization":
            "Bearer eb7213a31381c24c04ac2a85d08963dfbb64be18c79b914b4a2f4b6f714230c95d87cf86a52221c20391d1c77af6c14b514327a6967343a6205bd948cbf8c589c3a57f5709041530176084073979ac0f5ff250b767f34afee0dc327b62e6772eba9f895a03da37a87e4208ae08113a3552199cf1bbea5599699a6fea4ccfbca6"
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print("Something went wrong");
    }
  }

  // Future<Response<List<dynamic>>> getProducts() => get<List<dynamic>>(
  //       'http://localhost:1337/api/products',
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //     ).then(
  //       (value) {
  //         print(value.body);
  //         // print(json.decode(value.body));
  //         return value;
  //       },
  //     ).catchError((err) {
  //       print(err);
  //     });

  Future<Response<Product>> postProduct(body) =>
      post<Product>('https://fakestoreapi.com/products', body,
          decoder: (obj) => Product.fromJson(obj));
}
