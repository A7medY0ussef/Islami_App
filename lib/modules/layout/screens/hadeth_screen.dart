import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/hadeth_details/screens/hadeth_details_screen.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadeth> ahadeth = [];
  @override
  void initState() {
    readFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hadeth-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.black.withValues(alpha: 0.7), AppColors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/img_header.png',
                    width: 289,
                    height: 129,
                  ),
                  SizedBox(height: 40),
                  CarouselSlider.builder(
                    itemCount: ahadeth.length,
                    itemBuilder: (context, index, realIndex) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HadethDetailsScreen(
                                  hadeth: ahadeth[index],
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: 313,
                          decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 12.0,
                              left: 12.0,
                              right: 12.0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/img_left_corner.png',
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Center(
                                        child: Text(
                                          ahadeth[index].title,
                                          textDirection: .rtl,
                                          style: TextStyle(
                                            color: AppColors.black,
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
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Opacity(
                                          opacity: 0.3,
                                          child: Image.asset(
                                            'assets/images/HadithCardBackGround.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 0,
                                        child: Image.asset(
                                          'assets/images/Mosque-02.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Text(
                                                  ahadeth[index].body,
                                                  textAlign: TextAlign.center,
                                                  textDirection: .rtl,
                                                  style: TextStyle(
                                                    color: AppColors.black,
                                                    fontWeight: .w800,
                                                    fontSize: 18,
                                                    fontFamily: 'Janna',
                                                    height: 1.6,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      height: MediaQuery.of(context).size.height * 0.63,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> readFile() async {
    final futures = List.generate(
      50,
      (index) => rootBundle.loadString('assets/hadeeth/h${index + 1}.txt'),
    );
    final files = await Future.wait(futures);
    for (final data in files) {
      final lines = data.trim().split('\n').map((line) => line.trim()).toList();
      if (lines.length >= 2) {
        final title = lines[0];
        final body = lines.sublist(1).join('\n');
        ahadeth.add(Hadeth(title: title, body: body));
      }
    }
    if (mounted) {
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  String body;

  Hadeth({required this.title, required this.body});
}
