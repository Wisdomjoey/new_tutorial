import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/cart_controllers.dart';
import '../../data/controllers/popular_prod_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text.dart';

class ProductDetail extends StatelessWidget {
  final int pageId;

  const ProductDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProdController>().popularProdList[pageId];
    Get.find<PopularProdController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.sizedBoxHeight350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(product.img!),
              )),
            ),
          ),
          Positioned(
              left: Dimensions.sizedBoxWidth20,
              right: Dimensions.sizedBoxWidth20,
              top: Dimensions.sizedBoxHeight45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: const AppIcon(icon: Icons.arrow_back_ios),
                  ),
                  GetBuilder<PopularProdController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.cartPage);
                      },
                      child: Stack(
                        children: [
                          const AppIcon(icon: Icons.shopping_cart_outlined),
                          Get.find<PopularProdController>().totalItems >= 1
                              ? const Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconSize: 20,
                                    iconColor: Colors.transparent,
                                    bgColor: AppColors.mainColor,
                                  ))
                              : Container(),
                          Get.find<PopularProdController>().totalItems >= 1
                              ? Positioned(
                                  right: 5,
                                  top: 5,
                                  child: bigText(
                                    text: Get.find<PopularProdController>()
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ))
                              : Container()
                        ],
                      ),
                    );
                  }),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.sizedBoxHeight350 - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.sizedBoxWidth20,
                    right: Dimensions.sizedBoxWidth20,
                    top: Dimensions.sizedBoxHeight20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name!,
                    ),
                    SizedBox(
                      height: Dimensions.sizedBoxHeight20,
                    ),
                    bigText(text: 'Introduce'),
                    SizedBox(
                      height: Dimensions.sizedBoxHeight20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: ExpandableText(
                          text: product.description!,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.sizedBoxHeight20,
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProdController>(builder: (popularProd) {
        return Container(
          height: Dimensions.sizedBoxHeight120,
          padding: EdgeInsets.only(
            top: Dimensions.sizedBoxHeight30,
            bottom: Dimensions.sizedBoxHeight30,
            left: Dimensions.sizedBoxWidth20,
            right: Dimensions.sizedBoxWidth20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
            color: AppColors.buttonBackgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.sizedBoxHeight20,
                    bottom: Dimensions.sizedBoxHeight20,
                    left: Dimensions.sizedBoxWidth20,
                    right: Dimensions.sizedBoxWidth20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProd.setQuantity(false);
                      },
                      child: const Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.sizedBoxWidth10 / 2,
                    ),
                    bigText(text: popularProd.inCartItems.toString()),
                    SizedBox(
                      width: Dimensions.sizedBoxWidth10 / 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProd.setQuantity(true);
                      },
                      child: const Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  popularProd.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.sizedBoxHeight20,
                      bottom: Dimensions.sizedBoxHeight20,
                      left: Dimensions.sizedBoxWidth20,
                      right: Dimensions.sizedBoxWidth20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: bigText(
                    text: '\$${product.price!} | Add to Cart',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
