import 'package:get/get.dart';

import '../controllers/RegesterController.dart';


class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }}