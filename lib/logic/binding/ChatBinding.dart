import 'package:get/get.dart';

import '../controllers/ChatController.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => ChatController());


  }}