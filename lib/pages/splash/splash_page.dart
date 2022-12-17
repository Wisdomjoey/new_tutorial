// import 'dart:async';

// import 'package:flutter/animation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:new_tutproj/routes/route_helper.dart';

// import '../../data/controllers/popular_prod_controller.dart';
// import '../../data/controllers/recommended_prod_controller.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late Animation<double> animation;
//   late AnimationController controller;

//   Future<void> _loadResources() async {
//     await Get.find<PopularProdController>().getPopularProdList();
//     await Get.find<RecommendedProdController>().getRecommendedProdList();
//   }

//   @override
//   void initState() {
//     super.initState();

//     _loadResources();

//     controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2))
//           ..forward();
//     animation = CurvedAnimation(parent: controller, curve: Curves.linear);

//     Timer(const Duration(seconds: 3),
//         (() => Get.offNamed(RouteHelper.getInitial())));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ScaleTransition(
//             scale: animation,
//             child: Center(
//                 child: Image.asset(
//               'assets/images/logo.png',
//               width: 150,
//             )),
//           ),
//           Center(
//               child: Image.asset(
//             'assets/images/logo1.png',
//             width: 150,
//           )),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
