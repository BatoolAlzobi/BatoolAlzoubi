import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/DrawerController/SettingPageController.dart';
import 'package:new_shop/view/DrawerPages/Notifications.dart';
import 'package:new_shop/view/DrawerPages/ReportPage.dart';
import 'package:new_shop/view/DrawerPages/SettingPage.dart';
import 'package:new_shop/view/DrawerPages/ShowDiscounts.dart';
import '../../utls/Themes.dart';
import '../DrawerPages/GiftRequest.dart';
import '../Mazad.dart';
import '../chatting/Chat.dart';

class myDrawer extends GetView<SettingPageController> {

  @override
  Widget build(BuildContext context) {


    return GetX<SettingPageController>(
        builder: (c) =>  Drawer(
          backgroundColor:  controller.col==1?
          Colors.black
              :Colors.white,

     child: GetX<SettingPageController>(
       builder: (c) =>  ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color:
              controller.col==1?Colors.grey:Themes.color2,



            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/shop.png'),
                  radius: 50,
                ),
                Text("${controller.user_name}", style: Themes.bodyText2,)
              ],
            ),
          ),
          SizedBox(height: 25,),
          ListTile(
            leading: Icon(Icons.present_to_all),
            title:  Text('طلب هدية', style: Themes.subtitle2

           // Themes.bodyText1,
            ),
            onTap: () {
              Get.to(()=>GiftRequest()) ;
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title:  Text('الإشعارات', style:
            Themes.subtitle2

          //  Themes.bodyText1,
            ),
            onTap: () {
              Get.to(NotificationPage()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title:  Text('المحادثات', style: Themes.subtitle2
           // Themes.bodyText1,
            ),
            onTap: () {
              Get.toNamed('/chatting');

            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title:  Text('خصوماتي', style: Themes.subtitle2
              // Themes.bodyText1,
            ),
            onTap: () {
              Get.to(ShowDiscounts()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title:  Text('الإعدادات', style:Themes.subtitle2
          //  Themes.bodyText1,
            ),
            onTap: () {
              Get.to(SettingPage()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.report),
            title:  Text('إبلاغ', style: Themes.subtitle2
            //Themes.bodyText1,
            ),
            onTap: () {
              Get.to(ReportPage()) ;

            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title:  Text('تسجيل الخروج', style:Themes.subtitle2
          //  Themes.bodyText1,
            ),
            onTap: () {
             // Get.to(LoginView()) ;

              Get.to(mazad());
            },
          ),
        ],
      ),),),

    );


  }

}