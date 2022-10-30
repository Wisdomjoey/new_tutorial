import 'package:get/get.dart';

import '../../utils/appConstants.dart';
import '../api/api_client.dart';

class RecommendedProdRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProdRepo({required this.apiClient});

  Future<Response> getRecommendedProdList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PROD_URI);
  }
}
