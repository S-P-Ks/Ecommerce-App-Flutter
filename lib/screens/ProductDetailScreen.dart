import 'package:ecommapp/Constants/TextWidget.dart';
import 'package:ecommapp/Constants/fonts.dart';
import 'package:ecommapp/controllers/Product_Item_controller.dart';
import 'package:ecommapp/controllers/Product_detai_controller.dart';
import 'package:ecommapp/controllers/Wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';

import '../models/Product.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  ProductDetailScreen({Key? key}) : super(key: key);

  ProductDetailController pc = Get.find<ProductDetailController>();
  WishListController wc = Get.find<WishListController>();

  Widget getRating(var n) {
    final num = n.round();
    switch (num) {
      case 1:
        return Row(
          children: const [
            Icon(Icons.star),
            Icon(Icons.star_border_outlined),
            Icon(Icons.star_border_outlined),
            Icon(Icons.star_border_outlined),
            Icon(Icons.star_border_outlined)
          ],
        );
        break;
      case 2:
        return Row(
          children: const [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border_outlined),
            Icon(Icons.star_border_outlined),
            Icon(Icons.star_border_outlined)
          ],
        );
        break;
      case 3:
        return Row(
          children: const [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border_outlined),
            Icon(Icons.star_border_outlined)
          ],
        );
        break;
      case 4:
        return Row(
          children: const [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star_border_outlined)
          ],
        );
        break;
      case 5:
        return Row(
          children: const [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star)
          ],
        );
        break;
      default:
        return Row(
          children: const [],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters["id"] as String;
    // print(id);
    Product p = pc.getProductById(id);
    // print("heelo");
    return Scaffold(
      appBar: AppBar(
        title: Text(p.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "${p.title}",
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: FittedBox(
                  child: Image.network(p.image),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        TextWidget.getText("Ratings : ", "Quicksand", 15),
                        Spacer(),
                        getRating(p.rating.rate),
                        Text("(${p.rating.count})"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget.getText("Price : ", "Quicksand", 20),
                        Spacer(),
                        TextWidget.getText("\$${p.price}", "Quicksand", 20),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${p.description}",
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15, fontFamily: "Quicksand"), // new
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Add to cart"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            wc.addProduct(p.id);
                          },
                          icon: Icon(
                            Icons.bookmark_add_outlined,
                          ),
                        )
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
