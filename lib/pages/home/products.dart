import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/recommended_prod_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/appConstants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_text.dart';
import '../../widgets/small_text.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: Dimensions.sizedBoxWidth20),
        child: Column(
          children: [
            Row(
              children: [
                bigText(text: 'Recommended'),
                SizedBox(
                  width: Dimensions.sizedBoxWidth10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: bigText(
                    text: '.',
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  width: Dimensions.sizedBoxWidth10,
                ),
                smallText(
                  text: 'Food pairing',
                ),
              ],
            ), // List of products
            GetBuilder<RecommendedProdController>(builder: (recommendedProd) {
              return recommendedProd.isLoaded
                  ? (ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: recommendedProd.recommendedProdList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(index);
                            Get.toNamed(RouteHelper.getRecommendedFood(index, 'home'));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                right: Dimensions.sizedBoxWidth20,
                                bottom: Dimensions.sizedBoxHeight10),
                            child: Row(
                              children: [
                                Container(
                                  width: Dimensions.sizedBoxWidth120,
                                  height: Dimensions.sizedBoxWidth120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    color: Colors.white38,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(recommendedProd
                                          .recommendedProdList[index].img!),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: Dimensions.sizedBoxHeight100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(
                                                Dimensions.radius20),
                                            bottomRight: Radius.circular(
                                                Dimensions.radius20)),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.sizedBoxWidth10,
                                          right: Dimensions.sizedBoxWidth10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          bigText(
                                              text: recommendedProd
                                                  .recommendedProdList[index]
                                                  .name!),
                                          smallText(
                                              text: recommendedProd
                                                  .recommendedProdList[index]
                                                  .description!),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              IconText(
                                                  icon: Icons.circle_sharp,
                                                  text: 'Normal',
                                                  iconColor:
                                                      AppColors.iconColor1),
                                              IconText(
                                                  icon: Icons.location_on,
                                                  text: '1.7km',
                                                  iconColor:
                                                      AppColors.mainColor),
                                              IconText(
                                                  icon:
                                                      Icons.access_time_rounded,
                                                  text: '32min',
                                                  iconColor:
                                                      AppColors.iconColor2),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }))
                  : const CircularProgressIndicator(
                      color: AppColors.mainColor,
                    );
            }),
          ],
        ));
  }
}
