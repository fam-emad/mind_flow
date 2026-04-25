import 'package:flutter/material.dart';

class Btnpuse extends StatelessWidget {
  const Btnpuse({super.key, required this.ontap, required this.icon});
  final IconData icon;
final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
          
              gradient: const LinearGradient(
                colors: [Color(0xFF7EB6FF), Color(0xFF4F8CFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
          
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                  blurRadius: 40,
                  spreadRadius: 5,
                ),
              ],
            ),
          
            child:   Icon(icon, color: Colors.black, size: 40),
          ),
             const SizedBox(height: 10),
                      const Text(
                        "STOP",
                        style: TextStyle(color: Colors.white38),
                      )
        ],
      ),
    );
  }
}


//  import 'package:flutter/material.dart';

// Widget _smallButton(IconData icon) {
//     return Container(
//       width: 70,
//       height: 70,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white.withOpacity(0.05),  
//       ),
//       child: Icon(icon, color: Colors.white54),
//     );
 // }

   
  
 