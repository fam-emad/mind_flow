import 'package:flutter/material.dart';

class Adva extends StatelessWidget {
  const Adva({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      padding: const EdgeInsets.all(16), // مسافة داخلية
          width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24), // تدوير الحواف

        gradient: const LinearGradient(
          colors: [
            Color(0xFF0F172A), // لون غامق
            Color(0xFF020617), // أغمق (زي الصورة)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // Gradient background زي الصورة

        boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 81, 65, 71).withOpacity(0.25),
                      blurRadius: 80,
                      spreadRadius: 10,
                    ),
                  ],
        // Shadow خفيف
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ================= ICON =================
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: Colors.white.withOpacity(0.05),
              // خلفية خفيفة للأيقونة

              border: Border.all(
                color: Colors.white12,
              ),
            ),

            child: const Icon(
              Icons.auto_awesome, // أيقونة AI (نجوم)
              color: Color(0xFFA855F7), // بنفسجي
              size: 22,
            ),
          ),

          const SizedBox(width: 16),

          // ================= TEXT =================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ===== TITLE =====
                const Text(
                  "AI FLOW INSIGHT",
                  style: TextStyle(
                    color: Color(0xFFA855F7), // بنفسجي
                    fontSize: 12,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // ===== DESCRIPTION =====
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.5,
                    ),

                    children: [

                      TextSpan(
                        text:
                            "You maintained a flow state for ",
                      ),

                      TextSpan(
                        text: "35 minutes",
                        style: TextStyle(
                          color: Color(0xFF60A5FA), // أزرق highlight
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextSpan(
                        text:
                            " straight. This is ",
                      ),

                      TextSpan(
                        text: "12%",
                        style: TextStyle(
                          color: Color(0xFF60A5FA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextSpan(
                        text:
                            " longer than your average. Afternoon sessions seem to be your sweet spot!",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
         ;
  }
}