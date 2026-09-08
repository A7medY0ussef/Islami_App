import 'package:flutter/material.dart';
import 'package:islami/core/constant/sura_model.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/sura_details/screens/quran_details_screen.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final suras = SuraModel.getAllSura();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/taj-mahal-agra-india.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.black.withValues(alpha: 0.7),
                    AppColors.black,
                  ],
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/img_header.png',
                      width: 299,
                      height: 144,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: AppColors.white,
                            endIndent: 50,
                            indent: 50,
                            height: 24,
                          );
                        },
                        padding: const EdgeInsets.all(8),

                        itemCount: suras.length,

                        itemBuilder: (context, index) {
                          final sura = suras[index];

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return QuranDetailsScreen(sura: sura);
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/img_sur_number_frame.png',
                                      width: 52,
                                      height: 52,
                                    ),
                                    Text(
                                      (sura.id + 1).toString(),
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      sura.suraEn,
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '${sura.ayaNumber} verse',
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  sura.suraAr,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
