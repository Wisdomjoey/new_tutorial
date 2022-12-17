import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tutproj/data/controllers/popular_prod_controller.dart';

import '../../data/controllers/cart_controllers.dart';
import '../../data/controllers/recommended_prod_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/appConstants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text.dart';

class RecommendedDetail extends StatelessWidget {
  final int pageId;
  final String page;

  const RecommendedDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProdController>().recommendedProdList[pageId];
    Get.find<PopularProdController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (page == 'cartpage') {
                        Get.toNamed(RouteHelper.getCartPage());
                      } else {
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: const AppIcon(icon: Icons.clear),
                  ),
                  // const AppIcon(icon: Icons.shopping_cart_outlined),
                  GetBuilder<PopularProdController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getCartPage());
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
                  })
                ]),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.sizedBoxWidth20),
                      topRight: Radius.circular(Dimensions.sizedBoxWidth20),
                    )),
                child: Center(
                    child: bigText(
                  text: product.name!,
                  size: Dimensions.font26,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.sizedBoxWidth20,
                      right: Dimensions.sizedBoxWidth20),
                  child: ExpandableText(text: product.description!),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProdController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.sizedBoxWidth20 * 2.5,
                right: Dimensions.sizedBoxWidth20 * 2.5,
                top: Dimensions.sizedBoxHeight10,
                bottom: Dimensions.sizedBoxHeight10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      icon: Icons.remove,
                      bgColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  bigText(
                    text: '\$${product.price!}  X  ${controller.inCartItems}',
                    color: AppColors.maianBlackColor,
                    size: Dimensions.font26,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                      icon: Icons.add,
                      bgColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.sizedBoxHeight20,
                          bottom: Dimensions.sizedBoxHeight20,
                          left: Dimensions.sizedBoxWidth20,
                          right: Dimensions.sizedBoxWidth20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: bigText(
                        text: '\$${product.price!} | Add to Cart',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
