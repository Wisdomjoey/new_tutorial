import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controllers/popular_prod_controller.dart';
import '../../models/popularProd_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/appConstants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';

class MainSlide extends StatefulWidget {
  const MainSlide({Key? key}) : super(key: key);

  @override
  State<MainSlide> createState() => _MainSlideState();
}

class _MainSlideState extends State<MainSlide> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProdController>(builder: (products) {
          return products.isLoaded
            ? (Container(
                height: Dimensions.pageView,
                child: PageView.builder(
                      controller: pageController,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: products.popularProdList.isEmpty
                          ? 1
                          : products.popularProdList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(
                            position, products.popularProdList[position]);
                      }),
                )
              )
              : (const CircularProgressIndicator(
                  color: AppColors.mainColor,
                ));
        }),
        GetBuilder<PopularProdController>(builder: (products) {
          return DotsIndicator(
            dotsCount: products.popularProdList.isEmpty
                ? 1
                : products.popularProdList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.sizedBoxHeight30,
        )
      ],
    );
  }

  Widget _buildPageItem(int position, ProductModel popularProd) {
    Matrix4 matrix = Matrix4.identity();

    if (position == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currentPageValue.floor() + 1) {
      var currScale = _scaleFactor +
          (_currentPageValue - position + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(position));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.sizedBoxWidth10,
                  right: Dimensions.sizedBoxWidth10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: position.isEven
                      ? const Color(0xFF69c5df)
                      : const Color(0xFF9294cc),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          popularProd.img!))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.sizedBoxWidth30,
                  right: Dimensions.sizedBoxWidth30,
                  bottom: Dimensions.sizedBoxHeight30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(3, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-3, 0),
                    ),
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.sizedBoxHeight15,
                      left: Dimensions.sizedBoxWidth15,
                      right: Dimensions.sizedBoxWidth15),
                  child: AppColumn(
                    text: popularProd.name!,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
