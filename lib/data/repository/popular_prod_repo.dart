import 'package:get/get.dart';

import '../../utils/appConstants.dart';
import '../api/api_client.dart';

class PopularProdRepo extends GetxService {
  final ApiClient apiClient;

  PopularProdRepo({required this.apiClient});

  Future<Response> getPopularProdList() async {
    return await apiClient.getData(AppConstants.POPULAR_PROD_URI);
  }
}
