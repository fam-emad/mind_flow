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
  if ( name=='Focused') return  Color(0xFF1E88E5);
  if (name=='Stressed') return Color(0xFFFB8C00);
  if (name=='Happy') return Color(0xFFFDD835);
  if (name=='Tired') return Color(0xFF90A4AE);
  if (name=='Surprised') return Color(0xFFBA68C8);
  if (name=='Angry') return Color(0xFFE53935);
 
  return AppColors.purbl;
}

 IconData geticon(String name) {
   if ( name=='Focused') return Icons.gps_fixed;
  if (name=='Stressed') return Icons.sentiment_dissatisfied;
  if (name=='Happy') return Icons.mood;
   if (name=='Tired') return Icons.battery_alert;
    if (name=='Surprised') return Icons.emoji_objects;
     if (name=='Angry') return Icons.mood_bad;

  return Icons.blur_on;
}

 