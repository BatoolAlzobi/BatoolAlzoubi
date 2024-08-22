import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_shop/logic/controllers/AppBarController.dart';
import 'package:new_shop/view/My_Orders/Orders.dart';
import 'package:new_shop/view/Favorite.dart';
import 'package:new_shop/view/ShopsPages/ShopsPage.dart';
import '../utls/Themes.dart';
import 'Products.dart';

class HomePage extends GetView<AppBarController> {
  final sampleController1 = Get.put(AppBarController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBarController>(
        init: AppBarController(),
        builder: (_controller) {
          return Scaffold(
            body: SizedBox.expand(

              child: PageView(
                physics:const ScrollPhysics(parent:
                NeverScrollableScrollPhysics()),

                children:  [

                  Favorite(),
                  Orders(),
                  ShopsPage(),
                  Product(),
                ],
                controller: controller.pageController,
              ),
            ),
            bottomNavigationBar:
            SizedBox( child:
            Obx(
                  () => FancyBottomNavigation(

                tabs: [
                  TabData(
                    iconData: Icons.favorite,
                    title: 'Favourite',
                  ),
                  TabData(
                    iconData: Icons.request_page,
                    title: 'Order',
                  ),
                  TabData(
                    iconData: Icons.shopping_cart,
                    title: 'Shop',
                  ),
                  TabData(
                    iconData: Icons.home_repair_service,
                    title: 'Product',
                  ),
                ],


                onTabChangedListener: (position) {
                  controller.currentIndex.value = position;
                 controller.pageController.jumpToPage(position);
                },
                initialSelection: controller.currentIndex.value,
                key: controller.bottomNavigationKey,
                inactiveIconColor: Colors.grey,
                circleColor: Themes.color,
              ),
            ),),
          );
        });
  }
}