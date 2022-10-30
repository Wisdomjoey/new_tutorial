import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:new_tutproj/data/controllers/cart_controllers.dart';
import 'package:new_tutproj/routes/route_helper.dart';
import 'package:new_tutproj/utils/colors.dart';
import 'package:new_tutproj/utils/dimensions.dart';
import 'package:new_tutproj/widgets/app_icon.dart';
import 'package:new_tutproj/widgets/big_text.dart';
import 'package:new_tutproj/widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.sizedBoxWidth20,
            right: Dimensions.sizedBoxWidth20,
            top: Dimensions.sizedBoxHeight20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(
                  width: Dimensions.sizedBoxWidth20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.initial);
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    bgColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.sizedBoxHeight20 * 5,
            left: Dimensions.sizedBoxWidth20,
            right: Dimensions.sizedBoxWidth20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.sizedBoxHeight15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (controller) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: controller.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 100,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Container(
                                width: Dimensions.sizedBoxWidth20 * 5,
                                height: Dimensions.sizedBoxWidth20 * 5,
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.sizedBoxHeight10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            controller.getItems[index].img!))),
                              ),
                              SizedBox(
                                width: Dimensions.sizedBoxWidth10,
                              ),
                              Expanded(
                                child: Container(
                                  height: Dimensions.sizedBoxWidth20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      bigText(
                                        text: controller.getItems[index].name!,
                                        color: Colors.black54,
                                      ),
                                      smallText(text: 'Spicy'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          bigText(
                                            text:
                                                '\$${controller.getItems[index].price!}',
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top:
                                                    Dimensions.sizedBoxHeight10,
                                                bottom:
                                                    Dimensions.sizedBoxHeight10,
                                                left:
                                                    Dimensions.sizedBoxWidth10,
                                                right:
                                                    Dimensions.sizedBoxWidth10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    popularProd
                                                        .setQuantity(false);
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions
                                                          .sizedBoxWidth10 /
                                                      2,
                                                ),
                                                bigText(
                                                    text: popularProd
                                                        .inCartItems
                                                        .toString()),
                                                SizedBox(
                                                  width: Dimensions
                                                          .sizedBoxWidth10 /
                                                      2,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    popularProd
                                                        .setQuantity(true);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
