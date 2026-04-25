import 'package:flutter/material.dart';

class NeuralSyncButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E), // لون خلفية الزر الداكن
        borderRadius: BorderRadius.circular(30), // حواف دائرية
        border: Border.all(color: Color(0xFF2B2B2B), width: 1), // بوردر داكن
        boxShadow: [
          // ظل النيون الأخضر
          BoxShadow(
            color: Color(0xFF4CAF50).withOpacity(0.5), // لون الظل الأخضر مع شفافية
            blurRadius: 10, // انتشار الظل
            spreadRadius: 2, // حجم الظل
          ),
          // ظل نيون أخضر آخر لمزيد من التأثير
          BoxShadow(
            color: Color(0xFF4CAF50).withOpacity(0.2), // لون الظل الأخضر مع شفافية أقل
            blurRadius: 20, // انتشار الظل
            spreadRadius: 5, // حجم الظل
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // أيقونة النقطة الخضراء
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Color(0xFF4CAF50), // لون النقطة الخضراء
              shape: BoxShape.circle, // شكل النقطة دائري
            ),
          ),
          SizedBox(width: 8), // مسافة بين النقطة والنص
          // نص "NEURAL SYNC ACTIVE"
          Text(
            'NEURAL SYNC ACTIVE',
            style: TextStyle(
              color: Color(0xFF4CAF50), // لون النص الأخضر
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}