import 'package:flutter/material.dart';

class Juice extends StatelessWidget {
  const Juice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // الكونتينر الخارجي الأساسي
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1C222B), // نفس اللون الداكن اللي في الصورة
        borderRadius: BorderRadius.circular(30), // حواف دائرية كبيرة
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. صورة العصير (الجزء العلوي)
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          //   child: Image.asset(
          //     ' assets/ Container (3).png', // صورة عصير من النت
          //     height: 200,
          //     width: double.infinity,
          //    fit: BoxFit.cover,
          //  ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 2. التاج الأخضر (AI RECOMMENDED)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A2E26), // خلفية خضراء داكنة
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF59FF7A), // النقطة الخضراء المنيرة
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "AI RECOMMENDED",
                        style: TextStyle(
                          color: Color(0xFF59FF7A),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // 3. العنوان الرئيسي
                const Text(
                  "Mood-Based Fuel",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // 4. النص الوصفي (مع تلوين اسم العصير)
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
                    children: [
                      TextSpan(text: "Based on your focus patterns, your cognitive energy is dipping. Rehydrate with a "),
                      TextSpan(
                        text: "Lemon Mint Juice",
                        style: TextStyle(color: Color(0xFF59FF7A), fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: " to boost alertness."),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // 5. قسم المعلومات السفلية (DRINK & BENEFIT)
                Row(
                  children: [
                    // عنصر المشروب (Drink)
                    Expanded(child: _buildInfoTile(
                      icon: Icons.restaurant,
                      iconColor: const Color(0xFF59FF7A),
                      label: "DRINK",
                      value: "Lemon\nMint Juice",
                    )),
                    
                    // عنصر الفائدة (Benefit)
                    Expanded(child: _buildInfoTile(
                      icon: Icons.bolt,
                      iconColor: const Color(0xFFA855F7),
                      label: "BENEFIT",
                      value: "Mental\nClarity",
                    )),
                  ],
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


// Widget مساعد لبناء العناصر الصغيرة في الأسفل
  Widget _buildInfoTile({required IconData icon, required Color iconColor, required String label, required String value}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
