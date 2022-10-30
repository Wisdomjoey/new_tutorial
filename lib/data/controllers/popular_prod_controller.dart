import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tutproj/models/cart_model.dart';

import '../../models/popularProd_model.dart';
import '../../utils/colors.dart';
import '../repository/popular_prod_repo.dart';
import 'cart_controllers.dart';

class PopularProdController extends GetxController {
  final PopularProdRepo popularProdRepo;

  PopularProdController({required this.popularProdRepo});

  List<ProductModel> _popularProdList = [];
  List<ProductModel> get popularProdList => _popularProdList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProdList() async {
    Response response = await popularProdRepo.getPopularProdList();

    if (response.statusCode == 200) {
      _popularProdList = [];
      _popularProdList
          .addAll(Product.fromJson(jsonDecode(response.body)).products);
      _isLoaded = true;
      print('fetched data');
      update();
    } else {
      print('could not fetch data');
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // print('quantity $_quantity');
      _quantity = checkQuantity(_quantity + 1);
      // print('quantity $_quantity');
    } else {
      // print('quantity $_quantity');
      _quantity = checkQuantity(_quantity - 1);
      // print('quantity $_quantity');
    }

    update();
  }

  int checkQuantity(int quantity) {
    // print('ch_quantity $quantity');
    // print('ch_cart $inCartItems');
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar('Item Count', 'You can\'t reduce more!',
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      // print('less_cart $inCartItems');
      //   print('less $quantity');
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return quantity;
      }

      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar('Item Count', 'You can\'t add more!',
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      // print('greater_cart $inCartItems');
      //   print('greater $quantity');
      return 20;
    } else {
      // print('return_cart $inCartItems');
      //   print('return $quantity');
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    // } else {
    //   Get.snackbar('Item Count', 'Add at least 1 item',
    //       backgroundColor: AppColors.mainColor, colorText: Colors.white);
    // }

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
