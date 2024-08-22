import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';

import '../controllers/HomePageController.dart';
import '../controllers/ProductController.dart';
class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => AppBarController(),fenix: true);
    Get.lazyPut(() => ProductController());




  }}