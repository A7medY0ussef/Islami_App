import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 33;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/close-up-islamic-new-year-with-quran-books.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.black.withValues(alpha: 0.7), AppColors.black],
              end: .bottomCenter,
              begin: .topLeft,
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: SafeArea(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/img_header.png',
                    width: 291,
                    height: 171,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: .w700,
                      color: AppColors.white,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        counter--;
                      });
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          'assets/images/SebhaBody 1.png',
                          width: 379,
                          height: 381,
                        ),

                        Positioned(
                          top: -75,
                          child: Image.asset(
                            'assets/images/Group 37.png',
                            width: 145,
                            height: 86,
                          ),
                        ),
                        Positioned(
                          top: 134,
                          child: Text(
                            'سبحان الله',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: .w700,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 209,
                          child: Text(
                            '$counter',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: .w700,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
