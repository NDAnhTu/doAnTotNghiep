import 'package:doantotnghiep/modules/home/view/home_view.dart';
import 'package:doantotnghiep/modules/mua_sam/view/mausam_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dich_vu/view/dichvu_view.dart';
import '../../tham_kham/view/thamkham_view.dart';
import '../controller/main_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        builder: (controller) {
          return Scaffold(
            body: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                ThamKhamView(),
                DichVuView(),
                MuaSamView(),
              ],
            ),
            bottomNavigationBar: GNav(
              gap: 5,
              backgroundColor: Colors.white,
              tabBackgroundColor: Colors.purple.withOpacity(0.1),
              padding: const EdgeInsets.all(15),
              tabMargin: const EdgeInsets.fromLTRB(5, 5, 5, 10),
              onTabChange: (index) {
                controller.changeTabIndex(index);
              },
              tabs: const [
                GButton(
                  haptic: true,
                  icon: Icons.pets,
                  text: 'Thông Tin',
                ),
                GButton(
                  haptic: true,
                  icon: Icons.healing_sharp,
                  text: 'Thăm Khám',
                ),
                GButton(
                  haptic: true,
                  icon: Icons.add_business_rounded,
                  text: 'Dịch Vụ',
                ),
                GButton(
                  haptic: true,
                  icon: Icons.shopping_bag,
                  text: 'Mua Sắm',
                ),
              ],
            ),
          );
        }
    );
  }
}
