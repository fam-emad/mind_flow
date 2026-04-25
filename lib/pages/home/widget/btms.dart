import 'package:flutter/material.dart';

class Btms extends StatelessWidget {
  const Btms({super.key, required this.icon, required this.ontap});
final IconData icon;
final Function()ontap;
  @override
  Widget build(BuildContext context) {

    return    GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.05),  
            ),
            child: Icon(icon, color: Colors.white54),
          ),
           const SizedBox(height: 10),
                      const Text(
                        "SKIP",
                        style: TextStyle(color: Colors.white38),
                      )
        ],
      ),
    ); ;
  }
}