import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class CustomOnboarding extends StatelessWidget {
  final String image;
  final String firstText;
  final String? secondText;
  const CustomOnboarding({
    super.key,
    required this.image,
    required this.firstText,
    this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/img_header.png', width: 291, height: 151),
          const Spacer(),
          Image.asset(image, width: 398, height: 415),
          const Spacer(),
          Text(
            firstText,
            style: const TextStyle(
              fontWeight: .w700,
              fontSize: 24,
              fontFamily: 'Janna',
              color: AppColors.gold,
            ),
          ),

          if (secondText?.isNotEmpty ?? false) ...[
            const SizedBox(height: 24),
            Text(
              secondText!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: .w700,
                fontSize: 18,
                fontFamily: 'Janna',
                color: AppColors.gold,
              ),
            ),
          ],
          const Spacer(),
        ],
      ),
    );
  }
}
