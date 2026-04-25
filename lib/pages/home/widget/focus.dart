import 'package:flutter/material.dart';

class Focusstat extends StatelessWidget {
   Focusstat({super.key, required this.color, required this.text});
final Color color;
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4), // خلفية شفافة
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          
             
          /// 🟢 الدوت الخضراء
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color:color,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 10),

          /// 🔤 النص
            Text(
            text,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
