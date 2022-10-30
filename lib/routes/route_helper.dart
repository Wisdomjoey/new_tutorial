import 'package:get/get.dart';
import 'package:new_tutproj/pages/cart/cart_page.dart';

import '../pages/home/main_page.dart';
import '../pages/product description/product_detail.dart';
import '../pages/product description/recomended_detail.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart';

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return ProductDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedDetail(pageId: int.parse(pageId!));
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
