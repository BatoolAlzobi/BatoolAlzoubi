import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/FavoriteController.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => FavoriteController());


  }}