import 'package:get/get.dart';

import '../data/api/api_client.dart';
import '../data/controllers/cart_controllers.dart';
import '../data/controllers/popular_prod_controller.dart';
import '../data/controllers/recommended_prod_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/popular_prod_repo.dart';
import '../data/repository/recommended_prod_repo.dart';
import '../utils/appConstants.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.UPLOAD_URL));

  Get.lazyPut(() => PopularProdRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProdRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  Get.lazyPut(() => PopularProdController(popularProdRepo: Get.find()));
  Get.lazyPut(() => RecommendedProdController(recommendedProdRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
