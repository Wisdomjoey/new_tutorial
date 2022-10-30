import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // Dynamic values for slide view
  static double pageView = screenHeight / 2.578125;
  static double pageViewContainer = screenHeight / 3.75;
  static double pageViewTextContainer = screenHeight / 6.875;

  // Dynamic height, padding and margin
  static double sizedBoxHeight10 = screenHeight / 82.5;
  static double sizedBoxHeight15 = screenHeight / 55;
  static double sizedBoxHeight20 = screenHeight / 41.25;
  static double sizedBoxHeight30 = screenHeight / 27.5;
  static double sizedBoxHeight45 = screenHeight / 18.3333333333333;
  static double sizedBoxHeight100 = screenHeight / 8.25;
  static double sizedBoxHeight120 = screenHeight / 6.875;
  static double sizedBoxHeight350 = screenHeight / 2.357142857142857;

  // Dynamic Width, padding and margin
  static double sizedBoxWidth10 = screenWidth / 36;
  static double sizedBoxWidth15 = screenWidth / 20;
  static double sizedBoxWidth20 = screenWidth / 18;
  static double sizedBoxWidth30 = screenWidth / 12;
  static double sizedBoxWidth45 = screenWidth / 8;
  static double sizedBoxWidth120 = screenWidth / 3;

  // Dynamic font and border radius
  static double font16 = screenHeight / 51.5625;
  static double font20 = screenHeight / 41.25;
  static double font26 = screenHeight / 31.73076923076923;
  static double radius15 = screenHeight / 55;
  static double radius20 = screenHeight / 41.25;
  static double radius30 = screenHeight / 27.5;

  // Dynamic icon
  static double iconSize24 = screenWidth / 15;
  static double iconSize16 = screenWidth / 22.5;
}
