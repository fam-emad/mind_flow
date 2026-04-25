import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:study_lamp/core/app_colors.dart';
import 'package:study_lamp/customs/custom_second_text.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({
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
    this.radius,
    required this.iscolor, required this.text2, required this.mintxt,
  });
  final String text;
  final String text2;
    final String mintxt;
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
        width: width ?? 342,
        height: height ?? 90,
        padding: const EdgeInsets.fromLTRB( 20.0, 10,35,20),

        decoration: BoxDecoration(
          color: ccolor ?? AppColors.box,
          borderRadius: BorderRadius.circular(radius ?? 20),
        ),
        child: Column(
          
          children: [
            Gap(8),
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap(5),
                iscolor
                    ? Icon(
                        icon ?? null,
                        size: iconsize ?? 27,
                        color: iconcolor ?? AppColors.secondaryColor,
                      )
                    : SizedBox.shrink(),
                Gap(8),
                SecondCustomeText(
                  text: text,
                  fontSize: fontSize,
                  fontColor: colorfont,
                ),

                   Spacer(),
                  
                 
                SecondCustomeText(
                  text: mintxt,
                  fontSize: fontSize,
                  fontColor: iconcolor ?? AppColors.secondaryColor,
                ),
                Gap(3),
                SecondCustomeText(
                  text: 'sec',
                  fontSize: 15,
                  fontColor: iconcolor ?? AppColors.secondaryColor,
                ),
              ],
            ),
            Row(
              children: [
                Gap(10),
                SecondCustomeText(
                      text: text2,
                      fontSize: 15,
                      fontColor: AppColors.textColor_gruy,
                    ),
              ],
            ),
                        
          ],
        ),
      ),
    );
  }
}
