import 'package:get/get.dart';
import 'package:new_tutproj/pages/cart/cart_page.dart';
import 'package:new_tutproj/pages/home/home_page.dart';
import 'package:new_tutproj/pages/splash/splash_page.dart';

import '../pages/home/main_page.dart';
import '../pages/product description/product_detail.dart';
import '../pages/product description/recomended_detail.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart';
  static const String splashPage = '/splash-page';

  static String getInitial() => '$initial';
  static String getSplashPage() => '$splashPage';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() =>
      '$cartPage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomePage()),
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return ProductDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          // var pageId = Get.parameters['pageId'];
          // return RecommendedDetail(pageId: int.parse(pageId!));
          return const CartPage();
        },
        transition: Transition.fadeIn),
  ];
}
