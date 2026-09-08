import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/theme/app_colors.dart';

import '../../../core/constant/sura_model.dart';

class QuranDetailsScreen extends StatefulWidget {
  final SuraModel sura;
  const QuranDetailsScreen({super.key, required this.sura});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> suraList = [];
  @override
  Widget build(BuildContext context) {
    if (suraList.isEmpty) {
      readFile();
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        surfaceTintColor: AppColors.black,
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        centerTitle: true,
        title: Text(
          widget.sura.suraEn,
          style: TextStyle(
            fontWeight: .w700,
            fontSize: 24,
            fontFamily: 'Janna',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Image.asset('assets/images/img_left_corner.png'),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      widget.sura.suraAr,
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
                  child: Image.asset('assets/images/img_right_corner.png'),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Text.rich(
                  TextSpan(
                    children: suraList.map((e) {
                      int index = suraList.indexOf(e);
                      return TextSpan(text: '$e[${index + 1}] ');
                    }).toList(),
                  ),
                  style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: .center,
                  textDirection: .rtl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void readFile() async {
    String data = await rootBundle.loadString(
      'assets/Suras/${widget.sura.id + 1}.txt',
    );
    data = data.trim();
    suraList = data.split('\n');
    setState(() {});
  }
}
