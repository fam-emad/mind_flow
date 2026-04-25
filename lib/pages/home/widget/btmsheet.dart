import 'package:flutter/material.dart';
import 'package:study_lamp/pages/home/widget/sittings/settings.dart';

void showFocusSessionSheet(BuildContext context,double workValue1) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return   FocusSessionSheet(workValue1: workValue1,);
    },
  );
}