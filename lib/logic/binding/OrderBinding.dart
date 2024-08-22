import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/CartController.dart';


class CartBinding extends  Bindings{
  @override
  void dependencies() {
    Get.put(CartController());
    }

}