import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/TreatBasketController.dart';


class TreatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TreatBasketController());
  }}