import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/screens/layout_screen.dart';
import 'package:islami/modules/onboarding/widgets/custom_dot_indicator.dart';
import 'package:islami/modules/onboarding/widgets/custom_onboarding.dart';
import 'package:islami/modules/onboarding/models/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onBoardingData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final data = onBoardingData[index];

                    return CustomOnboarding(
                      image: data.image,
                      firstText: data.firstText,
                      secondText: data.secondText,
                    );
                  },
                ),
              ),

              Row(
                children: [
                  if (currentIndex > 0)
                    TextButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w700,
                          color: AppColors.gold,
                          fontFamily: 'Janna',
                        ),
                      ),
                    ),
                  Spacer(),
                  ...List.generate(
                    onBoardingData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 11),
                      child: CustomDotIndicator(
                        isActive: index == currentIndex,
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      if (currentIndex == onBoardingData.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LayoutScreen(),
                          ),
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == onBoardingData.length - 1 ? 'Finish' : 'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .w700,
                        color: AppColors.gold,
                        fontFamily: 'Janna',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
