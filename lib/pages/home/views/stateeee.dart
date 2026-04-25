import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:study_lamp/core/app_colors.dart';
import 'package:study_lamp/pages/home/views/data/bar_shart.dart';
import 'package:study_lamp/pages/home/views/data/pie_chart.dart';
import 'package:study_lamp/pages/state/widget/adva.dart';
import 'package:study_lamp/pages/state/widget/juice.dart'; 

class StateRe extends StatelessWidget {
  const StateRe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85, // 👈 شبه full screen
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration:  BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),

          /// 🔥 drag indicator
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 15),

           Text(
            'Session Summary',
            style: TextStyle(
              fontSize: 22,
              color: AppColors.textColor_wihte,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          /// 🔥 المحتوى
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children:   [
                  Gap(20),
                  Barchart2(),
                  Gap(10),
                  PieChart2(),
                  Gap(10),
                  Adva(),
                  Gap(10),
                  Juice(),
                  Gap(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


void showSummaryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 👈 مهم
    backgroundColor: Colors.transparent,
    builder: (context) {
      return   StateRe();
    },
  );
}