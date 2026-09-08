class OnboardingModel {
  final String image;
  final String firstText;
  final String? secondText;

  const OnboardingModel({
    required this.image,
    required this.firstText,
    this.secondText,
  });
}

final List<OnboardingModel> onBoardingData = [
  const OnboardingModel(
    image: 'assets/images/Nor7b.png',
    firstText: 'Welcome To Islmi App',
  ),
  const OnboardingModel(
    image: 'assets/images/kabba.png',
    firstText: 'Welcome To Islmi App',
    secondText: 'We Are Very Excited To Have You In Our Community',
  ),
  const OnboardingModel(
    image: 'assets/images/welcome.png',
    firstText: 'Reading the Quran',
    secondText: 'Read, and your Lord is the Most Generous',
  ),
  const OnboardingModel(
    image: 'assets/images/bearish.png',
    firstText: 'Bearish',
    secondText: 'Praise the name of your Lord, the Most High',
  ),
  const OnboardingModel(
    image: 'assets/images/radio.png',
    firstText: 'Holy Quran Radio',
    secondText:
        'You can listen to the Holy Quran Radio through the application for free and easily',
  ),
];
