import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:study_lamp/core/app_colors.dart';
import 'package:study_lamp/customs/custom_second_text.dart';
import 'package:study_lamp/pages/current_stute/widget/stute_grean.dart'; 

class CustomBtm extends StatelessWidget {
  const CustomBtm({
    super.key,
    required this.text,
    this.onTap,
    this.ccolor,
    this.colorfont,
    required this.fontSize,
    
    this.iconsize,
    this.iconcolor,
    this.icon,
    this.height,
    this.width,
    this.radius, required this.iscolor,
  });
  final String text;
  final Function()? onTap;
  final Color? ccolor;
  final Color? colorfont;
  final double? iconsize;
  final Color? iconcolor;
  final IconData? icon;
  final double fontSize;
  final double? height;
  final double? width;
  final double? radius;

  final bool iscolor;
  
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 250,
        height: height ?? 97,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),

        decoration: BoxDecoration(
           gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
      
      colors: [
         Color.fromARGB(255, 51, 48, 68), // يبدأ بالتلاشي
        Color.fromARGB(255, 21, 21, 26), // درجة أخف
        Color(0xFF0A0E14), // القاعدة (أخف من السواد التام)
      ],
        ),
          //color: ccolor ?? Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(20),
            NeuralSyncButton(),
              Gap(35),
            SecondCustomeText(
              text: text,
              fontSize: fontSize,
              fontColor:colorfont,
            ),
            Gap(8),
             SecondCustomeText(
              text: 'Analyzing real-time data and behavior',
              fontSize: 15,
              fontColor:AppColors.textColor_gruy,
            ),
            // isimage
            //     ? Icon(
            //         icon ?? null,
            //         size: iconsize ?? 50,
            //         color: iconcolor ?? AppColors.icons,
            //       )
            //     : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
