import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:study_lamp/core/app_colors.dart';
import 'package:study_lamp/customs/custom_second_text.dart'; 

class ButtonCustom extends StatefulWidget {
  final String text;
  final double fontSize;
  final IconData? icon;
  final bool isSelected;
  final bool isimage;
  final Color? backColor;
    final Color? fontColor;
  final Function()? onTap;

  const ButtonCustom({
    super.key,
    required this.text,
    required this.fontSize,
    this.icon,
    this.isSelected = false,
    required this.isimage,
    this.backColor,
    this.onTap, this.fontColor,
  });

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            width: 350,
            height: 97,
            decoration: BoxDecoration(
              ////
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFFFFFFFF), Color(0xFF86B4E5)],
              ),
              //color:widget.backColor?? AppColors.textColor2.withValues(alpha: 0.8),
              borderRadius: BorderRadiusGeometry.circular(40),
              border: Border.all(
                color: AppColors.textColor_wihte ,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(
                    114,
                    120,
                    120,
                    120,
                  ).withValues(alpha: 0.5),
                  blurRadius: 150,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SecondCustomeText(
                  text: widget.text,
                  fontSize: widget.fontSize,
                  fontColor:  widget.fontColor,
                ),
                 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
