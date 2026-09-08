import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/screens/hadeth_screen.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key, required this.hadeth});
  final Hadeth hadeth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,

      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        centerTitle: true,
        title: Text(
          hadeth.title,
          style: TextStyle(fontSize: 20, fontWeight: .w700),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/img_left_corner.png',
                    color: AppColors.gold,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      hadeth.title,
                      textDirection: .rtl,
                      style: TextStyle(
                        color: AppColors.gold,
                        fontWeight: .w700,
                        fontSize: 24,
                        fontFamily: 'Janna',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/img_right_corner.png',
                    color: AppColors.gold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              hadeth.body,
              textDirection: .rtl,
              style: TextStyle(
                fontWeight: .w700,
                fontSize: 20,
                color: AppColors.gold,
              ),
            ),
          ),
          Spacer(),
          Image.asset('assets/images/Mosque-02.png'),
        ],
      ),
    );
  }
}
