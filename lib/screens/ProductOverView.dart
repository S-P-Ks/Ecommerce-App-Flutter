import 'dart:math';

import 'package:ecommapp/controllers/Product_Item_controller.dart';
import 'package:ecommapp/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum FilterOptions {
  OnlyFavorites,
  ShowAll,
}

class ProductOverView extends GetView<ProductItemController> {
  const ProductOverView({Key? key}) : super(key: key);
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyShop",
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: controller.obx(
          (data) {
            return Container(
              child: ListView.builder(
                itemCount: controller.getProducts.length,
                itemBuilder: ((context, index) {
                  final img = controller.getProducts[index].image;
                  final Title = controller.getProducts[index].title;
                  final price = controller.getProducts[index].price;
                  final id = controller.getProducts[index].id;

                  return Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: ListTile(
                        onTap: () {
                          Get.toNamed("/shop/$id");
                        },
                        style: ListTileStyle.list,
                        contentPadding: const EdgeInsets.all(10),
                        leading: SizedBox(
                          width: 100,
                          height: 100,
                          child: FittedBox(
                            child: Image.network(img),
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Text(Title),
                        trailing: Text("\$${price}"),
                      ),
                    ),
                  );
                }),
              ),
            );
          },
          onError: (error) => Center(
            child: Text(error.toString()),
          ),
        ),
      ),
    );
  }
}
