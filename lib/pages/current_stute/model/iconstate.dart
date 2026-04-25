import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:study_lamp/core/app_colors.dart';
//'focus', 'stressed', 'tired', 'unfocused'


// مهم جداً عشان الـ Random

String getRandomStatus() {
  // 1. بنعرف اللستة اللي فيها الكلمات
  List<String> statuses = ['focus', 'stressed', 'tired', 'unfocused'];

  // 2. بنعمل Instance من الكلاس Random
  Random random = Random();

  // 3. بنطلع رقم عشوائي ما بين 0 و 3 (اللي هو طول اللستة - 1)
  int randomIndex = random.nextInt(statuses.length);

  // 4. بنرجع الكلمة اللي مكانها طلع عشوائي
  return statuses[randomIndex];
}



Color getColor(String name) {
  if ( name=='Focused') return AppColors.secondaryColor;
  if (name=='Stressed') return AppColors.red;
  if (name=='Happy') return AppColors.grean;
 
  return AppColors.purbl;
}

 IconData geticon(String name) {
   if ( name=='Focused') return Icons.filter_center_focus;
  if (name=='Stressed') return Icons.shutter_speed;
  if (name=='Happy') return Icons.battery_alert;
  return Icons.blur_on;
}

 