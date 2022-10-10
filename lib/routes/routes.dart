import 'package:flutter_woocommerce/view/screens/auth/login_page.dart';
import 'package:flutter_woocommerce/view/screens/auth/signup_page.dart';
import 'package:flutter_woocommerce/view/screens/home/product_details/product_details_page.dart';
import 'package:flutter_woocommerce/view/screens/home/product_page/products_page.dart';
import 'package:flutter_woocommerce/view/screens/main_screen/main_screen.dart';
import 'package:flutter_woocommerce/utils/no_connection_screen.dart';
import 'package:flutter_woocommerce/view/screens/splash_screen.dart';
import 'package:get/route_manager.dart';

class Routes {
  static const splashScreen = '/splashScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const mainScreen = '/mainScreen';
  static const productPage = '/productPage';
  static const productDetailsPage = '/productDetailsPage';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),

    /////////// auth route
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignupPage(),
    ),

    /// app route
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
    ),

    GetPage(
      name: Routes.productPage,
      page: () => ProductsPage(),
    ),

    GetPage(
      name: Routes.productDetailsPage,
      page: () => ProductDetailsPage(),
    ),

    // GetPage(
    // name: Routes.choosePage,
    // page: ()=>  ChoosePage(),
    // transition: Transition.fade,
    // transitionDuration: const Duration(milliseconds: 800),
    // ),
  ];
}
