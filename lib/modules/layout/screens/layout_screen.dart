import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/screens/hadeth_screen.dart';
import 'package:islami/modules/layout/screens/quran_screen.dart';
import 'package:islami/modules/layout/screens/radio_screen.dart';
import 'package:islami/modules/layout/screens/sebha_screen.dart';
import 'package:islami/modules/layout/screens/time_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int index = 0;
  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,

      body: screens[index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,

        onTap: (value) {
          setState(() {
            index = value;
          });
        },

        backgroundColor: AppColors.gold,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(color: AppColors.white),
        fixedColor: AppColors.white,

        items: [
          buildBottomNavItem(label: 'Quran', icon: 'assets/icons/ic_quran.svg'),
          buildBottomNavItem(
            label: 'Hadith',
            icon: 'assets/icons/ic_hadeth.svg',
          ),
          buildBottomNavItem(label: 'Sebha', icon: 'assets/icons/ic_sebha.svg'),
          buildBottomNavItem(label: 'Radio', icon: 'assets/icons/ic_radio.svg'),
          buildBottomNavItem(label: 'Time', icon: 'assets/icons/ic_time.svg'),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavItem({
    required String label,
    required String icon,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon, width: 22, height: 22),
      label: label,

      activeIcon: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.black.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(66),
        ),
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
