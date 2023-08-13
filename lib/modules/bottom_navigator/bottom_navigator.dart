import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget bottomNavigator() {
  return GNav(
      gap: 5,
      backgroundColor: Colors.white,
      rippleColor: Colors.grey.shade200,
      tabBackgroundColor: Colors.purple.withOpacity(0.1),
      padding: const EdgeInsets.all(15),
      tabMargin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      tabs: const [
        GButton(
          haptic: true,
          icon: Icons.account_circle,
          text: 'Thông Tin',
        ),
        GButton(
          haptic: true,
          icon: Icons.healing_sharp,
          text: 'Thăm Khám',
        ),
        GButton(
          haptic: true,
          icon: Icons.pets,
          text: 'Cơ Sở',
        ),
        GButton(
          haptic: true,
          icon: Icons.maps_home_work_outlined,
          text: 'Kí Gửi',
        ),
      ],
  );
}
