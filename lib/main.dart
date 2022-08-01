import 'package:ecommapp/bindings/loginBindings.dart';
import 'package:ecommapp/bindings/signupBinding.dart';
import 'package:ecommapp/bindings/wishListBindings.dart';
import 'package:ecommapp/screens/CartScreen.dart';
import 'package:ecommapp/screens/OnboardingScreen.dart';
import 'package:ecommapp/screens/LoginScreen.dart';
import 'package:ecommapp/screens/OrderScreen.dart';
import 'package:ecommapp/screens/ProductDetailScreen.dart';
import 'package:ecommapp/screens/ProductOverView.dart';
import 'package:ecommapp/screens/Signup.dart';
import 'package:ecommapp/screens/SplashScreen.dart';
import 'package:ecommapp/screens/WishListScreen.dart';
import 'package:ecommapp/screens/profileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/productBindings.dart';
import 'bindings/productDetailBinding.dart';
import 'controllers/Wishlist_controller.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final getStorge = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(getStorge.read("intro"));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? getStorge.read("intro") != null && getStorge.read("intro") == "done"
              ? "/"
              : "/intro"
          : "/login",
      //  getStorge.read("userID") != null ? "/" : "/login",
      // initialBinding: ProductBinding(),
      getPages: [
        GetPage(
          name: "/",
          page: () => ProductOverView(),
          transition: Transition.leftToRight,
          binding: ProductBinding(),
        ),
        GetPage(
          name: "/orders",
          page: () => OrderScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: "/shop/:id",
          page: () => ProductDetailScreen(),
          transition: Transition.leftToRight,
          binding: ProductDetailsBinding(),
        ),
        GetPage(
          name: "/wishlist",
          page: () => WishListScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: "/splash",
          page: () => SplashScreen(),
          transition: Transition.leftToRight,
          // binding: WishListBinding(),
        ),
        GetPage(
          name: "/login",
          page: () => LoginScreen(),
          binding: LoginBindings(),
        ),
        GetPage(
          name: "/signup",
          page: () => SignUp(),
          binding: SingupBinding(),
        ),
        GetPage(
          name: "/cart",
          page: () => CartScreen(),
        ),
        GetPage(
          name: "/profile",
          page: () => ProfilePage(),
        ),
        GetPage(
          name: "/intro",
          page: () => OnboardingScreen(),
        )
      ],
      themeMode: ThemeMode.dark,
    );
  }
}
