// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_shop/logic/controllers/ChatDetailsController.dart';
//
// import '../../main.dart';
// import '../../services/auth_services.dart';
// import '../../utls/Themes.dart';
//
//
// class ChatDetails extends GetView<ChatDetailsController> {
//
//   // final controller = Get.put(ChatDetailsController());
//
//   final messageInsert = TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Directionality(
//         textDirection: TextDirection.rtl,
//         child:Scaffold(
//             body:
//             Obx(()
//             {    return
//               Column(
//                   children: <Widget>[
//                     SizedBox(
//                       height: 20,),
//                     Card(
//                       child: ListTile(
//                         trailing: IconButton(
//                           onPressed: () {
//                             //ChatDetailsController().disconnectPusher();
//                             Get.toNamed('/chatting');
//                           },
//                           icon: Icon(
//                             Icons.arrow_forward,
//                             color: Colors.black,
//                           ),
//                         ),
//                         leading: CircleAvatar(
//                           radius: 30,
//                           // backgroundImage: AssetImage("${controller.Images
//                           //     .value}"),
//                         ),
//                         title: Text('${controller.name}',
//                           style: Themes.bodyText1,
//                         ),
//                         subtitle: Text(
//                           "  .....  ",
//                           style: Themes.subtitle2,
//                         ),
//                       ),
//                     ),
//
//                     Flexible(
//                         child: ListView.builder(
//                             reverse: true,
//                             itemCount: controller.messsages.length,
//                             itemBuilder: (context, index) =>
//                                 controller.chat(
//                                     controller.messsages[index]["message"].toString(),
//                                     controller.messsages[index]["data"]))),
//
//                     Divider(
//                       height: 5.0,
//                       color: Colors.grey.shade600,
//                       thickness: 1,
//                     ),
//
//                     Container(
//                       child: ListTile(
//                         leading: IconButton(
//                           icon: Icon(
//                             Icons.camera_alt,
//                             color: Colors.grey.shade600,
//                             size: 35,
//                           ),
//                           onPressed: () {},
//                         ),
//                         title: Container(
//                           height: 40,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(
//                                 Radius.circular(10)),
//                             color: Colors.white,
//                             border: Border.all(
//                               color: Colors.grey.shade300,
//                               width: 1,
//                             ),
//                           ),
//                           padding: EdgeInsets.only(left: 15),
//                           child: TextFormField(
//                             textInputAction: TextInputAction.newline,
//                             keyboardType: TextInputType.multiline,
//                             controller: messageInsert,
//                             decoration: InputDecoration(
//                               hintText: "  ادخل رسالتك... ",
//                               hintStyle: Themes.subtitle3,
//                               border: InputBorder.none,
//                               focusedBorder: InputBorder.none,
//                               enabledBorder: InputBorder.none,
//                               errorBorder: InputBorder.none,
//                               disabledBorder: InputBorder.none,
//                             ),
//                             style: Themes.bodyText1,
//                             onChanged: (value) {},
//                           ),
//                         ),
//                         trailing: IconButton(
//                             icon: Icon(
//                               Icons.send,
//                               size: 30.0,
//                               color: Colors.grey.shade600,
//                             ),
//                             onPressed: () async {
//
//                               print("-----------------------------------------------------");
//                               print(controller.receiver_id);
//                               int r=int.parse(controller.receiver_id.value);
//                               print("-----------------------------------------------------");
//                               if (messageInsert.text.isEmpty) {
//                                 print("empty message");
//                               } else {
//                                 controller.messsages.insert(
//                                     0  , {
//                                   "data": 0,
//                                   "message": messageInsert.text
//                                 });
//
//                                 await AuthServices.send(
//                                     message: messageInsert.text,
//                                     sender_id : (await storage.read(key: 'id'))!,
//                                     receiver_id: controller.receiver_id.value);
//
//
//                                 messageInsert.text='';
//
//
//
//                               }
//                               FocusScopeNode currentFocus = FocusScope.of(
//                                   context);
//                               if (!currentFocus.hasPrimaryFocus) {
//                                 currentFocus.unfocus();
//                               }
//                             }),
//                       ),
//                     ),
//
//
//                   ]);
//             })
//         )
//     );
//   }
//
//
// }


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:pusher_client/pusher_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../main.dart';
import '../../models/batool/CharDetailsModel.dart';
import '../../utls/Themes.dart';
class ChatDetailsController extends GetxController {
  ChatDetailsController();

  var sender_id=''.obs;
  int i=1;
  var listmessage = <ChatDetails>[].obs ;
  late List<dynamic> jsonResponse;
  var chat_id=''.obs;
  var name=''.obs;
  var receiver_id=''.obs;
  String? _message;
  // get message => _message;
  ChatDetailsController._internal();
  var messsages = [].obs ;




  Widget chat(String message, int data) {

    print(message);
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment:
        data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // data == 0
          //     ? Container(
          //       height: 50,
          //       width: 60,
          //       child: CircleAvatar(
          //         radius: 10,
          //     //  backgroundImage: AssetImage("${controller.Images.value}" ),
          //   ),
          // )
          //     : Container(),
          //



          Padding(

            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(10.0),
                color: data == 0 ? Themes.color : Colors.red,
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 200),
                            child: Text(
                              message,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                )
            ),
          ),


          //
          data == 1
              ? Container(
            height: 50,
            width: 60,
            child: CircleAvatar(
              radius: 5,
              backgroundImage: AssetImage("images/3.jpg"),
            ),
          )
              : Container(),
        ],
      ),
    );
  }

  inti() async {
    sender_id.value=(await storage.read(key: 'id'))!;
    // ChatDetailsController().initPusher();
    // ChatDetailsController().connectPusher();
    // ChatDetailsController().subscribePusher(receiver_id.value);
    //  ChatDetailsController().disconnectPusher();
  }

  @override
  void onInit() {

    chat_id.value=Get.arguments['chat_id'];
    name.value=Get.arguments['name'];
    receiver_id.value=  Get.arguments['receiver_id'];
    // print("kkkkkkkkkkkkkkkkkkkkkkk");
    // print( name.value);
    // print( receiver_id.value);
    // print("kkkkkkkkkkkkkkkkkkkkkkk");
    //
    // ChatDetail(chat_id.value);
    // inti();
  }

  ChatDetail(chat_id) async {
    final response = await http.get(
      Uri.parse('${MyApp.api}/api/message/index/${chat_id}/1'),
    );

    ChatDetailsModel productModel =
    ChatDetailsModel.fromJson(jsonDecode(response.body));
    listmessage.assignAll(productModel.data);
    update();

    for(int i=0;i<listmessage.length;i++)
    {

      if(listmessage.elementAt(i).sender_id.toString()==await storage.read(key: 'id'))
        messsages.insert(
            0  , {
          "data": 0,
          "message": listmessage.elementAt(i).message
        });
      else
        messsages.insert(
            0  , {
          "data": 1,
          "message": listmessage.elementAt(i).message
        });


    }
    update();
  }

}






