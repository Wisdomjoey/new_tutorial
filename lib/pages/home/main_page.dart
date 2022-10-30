import 'package:flutter/material.dart';
import 'package:new_tutproj/pages/home/products.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'main_slide.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.sizedBoxHeight45, bottom: Dimensions.sizedBoxHeight15),
              padding: EdgeInsets.only(left: Dimensions.sizedBoxWidth20, right: Dimensions.sizedBoxWidth20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      bigText(text: 'Bangladesh', color: AppColors.mainColor),
                      Row(
                        children: [
                          smallText(
                            text: 'Narsingdi',
                            color: Colors.black54,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.sizedBoxWidth45,
                      height: Dimensions.sizedBoxWidth45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                    )
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: const [
                  MainSlide(),
                  Products(),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
