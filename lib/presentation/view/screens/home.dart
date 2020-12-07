import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:maneja/presentation/view/pages/home_page.dart';
import 'package:maneja/presentation/view/pages/profile_page.dart';
import 'package:maneja/presentation/view/pages/tnt_page.dart';
import 'package:maneja/presentation/viewmodel/main_viewmodel.dart';

class Home extends StatelessWidget {
  final MainViewmodel _mainViewmodel = Get.put(MainViewmodel(), tag: "mc");
  @override
  Widget build(BuildContext context) {
    if (_mainViewmodel.pages.isEmpty)
      _mainViewmodel.pages.assignAll(
        [
          HomePage(),
          TntPage(),
          ProfilePage(),
        ],
      );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: [
          Obx(
            () => IconButton(
              icon: AnimatedSwitcher(
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                duration: Duration(seconds: 1),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: _mainViewmodel.iconDarkmode.value,
              ),
              onPressed: () => _mainViewmodel.changeThemeMode(),
            ),
          ),
        ],
      ),
      body: Obx(
        () => SafeArea(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Row(
              children: [
                Expanded(child: _mainViewmodel.currentPage),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => GNav(
          gap: 6,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          curve: Curves.elasticInOut,
          onTabChange: (int index) {
            _mainViewmodel.selectedIndex.value = index;
          },
          selectedIndex: _mainViewmodel.selectedIndex.value,
          tabs: [
            GButton(
              text: "Home",
              icon: Icons.money_outlined,
            ),
            GButton(
              text: "tips n tricks",
              icon: Icons.dashboard,
            ),
            GButton(
              text: "Profile",
              icon: Icons.account_circle_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
