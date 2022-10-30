import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_tutproj/data/controllers/popular_prod_controller.dart';
import 'package:new_tutproj/pages/home/main_page.dart';
import 'package:new_tutproj/routes/route_helper.dart';

import 'data/controllers/recommended_prod_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProdController>().getPopularProdList();
    Get.find<RecommendedProdController>().getRecommendedProdList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      home: const MainPage(),
    );
  }
}
