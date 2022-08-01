import 'package:ecommapp/screens/OrderScreen.dart';
import 'package:ecommapp/screens/ProductOverView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:get_storage/get_storage.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  final getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final username =
        getStorage.read("username") != null ? getStorage.read("username") : "";
    String imgText =
        username != "" ? username.substring(0, 2).toUpperCase() : "";
    String imgurl = getStorage.read("imageUrl");

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed("/profile");
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.black54,
                      backgroundImage: NetworkImage(imgurl),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    username,
                    style:
                        const TextStyle(fontSize: 20, fontFamily: "Quicksand"),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_2_outlined),
            title: Text('Shop'),
            onTap: () {
              Get.toNamed(ProductOverView.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment_rounded),
            title: Text('Orders'),
            onTap: () {
              Get.toNamed(OrderScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_cart_checkout_outlined),
            title: Text('Cart'),
            onTap: () {
              Get.toNamed("/cart");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.bookmark_add_outlined),
            title: Text('Wish List'),
            onTap: () {
              Get.toNamed("/wishlist");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign Out'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              getStorage.remove("userID");
              Get.toNamed("/login");
            },
          ),
        ],
      ),
    );
  }
}
