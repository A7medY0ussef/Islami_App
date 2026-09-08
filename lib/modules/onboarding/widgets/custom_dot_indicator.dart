import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CustomDotIndicator extends StatelessWidget {
  final bool isActive;
  const CustomDotIndicator ({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 18 : 7,
      height: 7,
      decoration: BoxDecoration(
          color: isActive ? AppColors.gold : AppColors.gray,
          borderRadius: BorderRadius.circular(27)
      ),
    );
  }
}
