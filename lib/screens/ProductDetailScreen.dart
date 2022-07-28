import 'package:ecommapp/controllers/Product_Item_controller.dart';
import 'package:ecommapp/controllers/Product_detai_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Product.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({Key? key}) : super(key: key);

  ProductDetailController pc = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters["id"] as String;
    print(id);
    Product p = pc.getProductById(id);
    print("heelo");
    return Scaffold(
      appBar: AppBar(
        title: Text(p.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: FittedBox(
                  child: Image.network(p.image),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Price : "),
                        Expanded(child: Text("\$${p.price}"))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
