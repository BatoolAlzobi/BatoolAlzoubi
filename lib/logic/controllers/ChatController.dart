import 'dart:convert';

import 'package:get/get.dart';
//import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:new_shop/models/batool/AllChatModel.dart';

import '../../main.dart';
class ChatController extends GetxController {

   var  sender_id ="".obs;
   var receiver_id=''.obs;

  var listchat = <AllChat>[].obs;
  late List<dynamic> jsonResponse;

   AllChatting() async {
     sender_id.value = (await storage.read(key: 'id'))!;
     print("sender id is:");
     print(sender_id);
     final response = await http.get(
       Uri.parse('${MyApp.api}/api/chat/index/${sender_id.value}'),
     );

     AllChatNodel productModel = AllChatNodel.fromJson(jsonDecode(response.body));
     listchat.assignAll(productModel.data);
     update();
   }




@override
  void onInit() {
  // get();
  AllChatting();
  }
}

