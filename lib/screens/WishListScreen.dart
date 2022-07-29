import 'package:ecommapp/Constants/TextWidget.dart';
import 'package:ecommapp/controllers/Wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends GetView<WishListController> {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.getWishList);
    return Scaffold(
      appBar: AppBar(
        title: Text("WishList"),
      ),
      body: Container(
          child: Obx(
        () => controller.getWishList.length > 0
            ? ListView.builder(
                itemCount: controller.getWishList.length,
                itemBuilder: ((context, index) {
                  final img = controller.getWishList[index].image;
                  final Title = controller.getWishList[index].title;
                  final price = controller.getWishList[index].price;
                  final id = controller.getWishList[index].id;

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
                        title: Text(
                          Title.length > 20
                              ? Title.substring(0, 20) + "..."
                              : Title,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Quicksand",
                          ),
                        ),
                        subtitle: Text(
                          "\$${price}",
                          style: TextStyle(fontFamily: "Quicksand"),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark_add_outlined),
                        ),
                      ),
                    ),
                  );
                }),
              )
            : Center(
                child: TextWidget.getText(
                  "No Product added to the Wishlist.",
                  "Quicksand",
                  20,
                ),
              ),
      )),
    );
  }
}
