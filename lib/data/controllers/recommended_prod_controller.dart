import 'dart:convert';

import 'package:get/get.dart';

import '../../models/popularProd_model.dart';
import '../repository/recommended_prod_repo.dart';

class RecommendedProdController extends GetxController {
  final RecommendedProdRepo recommendedProdRepo;

  RecommendedProdController({required this.recommendedProdRepo});

  List<ProductModel> _recommendedProdList = [];
  List<ProductModel> get recommendedProdList => _recommendedProdList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProdList() async {
    Response response = await recommendedProdRepo.getRecommendedProdList();

    if (response.statusCode == 200) {
      _recommendedProdList = [];
      _recommendedProdList.addAll(Product.fromJson(jsonDecode(response.body)).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
