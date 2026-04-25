import 'package:flutter/material.dart';
import 'package:study_lamp/core/app_colors.dart'; 

class SecondCustomeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final bool isBlack;
  const SecondCustomeText({
    super.key,
    required this.text,
    required this.fontSize,
    this.isBlack = true,
    this.fontColor, this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
         // fontFamily: 'inter',
          fontWeight:fontWeight??  FontWeight.w900,
          fontSize: fontSize,
          color: fontColor ?? AppColors.textColor_wihte,
        ),
      ),
    );
  }
}
