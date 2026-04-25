// import 'package:flutter/material.dart';
// import 'package:study_lamp/core/network/socket_service.dart';
// import 'package:study_lamp/navigetorBar.dart';

// class WelcomeScreen extends StatefulWidget {

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//     final SocketService socketService = SocketService();
 
//   void initState() {
//     socketService.connect("ws{1111}.100:81");
//     return super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // استخدام التدرج اللوني للخلفية كما في الصورة
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: RadialGradient(
//             center: Alignment.center,
//             radius: 0.8,
//             colors: [
//               Color(0xFF1A233A), // لون فاتح في المنتصف
//               Color(0xFF0A0E14), // لون داكن في الأطراف
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Spacer(flex: 3),
              
//               // --- مكان اللوجو ---
//               // يمكنك استبدال الـ Container بـ Image.asset الخاص بك
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white.withOpacity(0.05), // خلفية خفيفة للدائرة
//                 ),
//                 child: const Center(
//                   child: Icon(
//                     Icons.bubble_chart, // أيقونة مؤقتة تشبه شكل اللوجو
//                     size: 60,
//                     color: Color(0xFF8EBAFF),
//                   ),
//                 ),
//               ),
              
//               const SizedBox(height: 30),
              
//               // اسم التطبيق
//               const Text(
//                 'MindFlow',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 48,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1.2,
//                 ),
//               ),
              
//               // الشعار النصي (Slogan)
//               const Text(
//                 'ELEVATE YOUR FOCUS',
//                 style: TextStyle(
//                   color: Color(0xFF8EBAFF),
//                   fontSize: 14,
//                   letterSpacing: 2.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
              
//               const SizedBox(height: 60),
              
//               // --- الزر الموجود في المنتصف ---
//               ElevatedButton(
//                 onPressed: () {
//                    Navigator.pushReplacement(context , MaterialPageRoute(builder: (c) => MainScreen()));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF8EBAFF),
//                   foregroundColor: Colors.black,
//                   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   elevation: 10,
//                   shadowColor: const Color(0xFF8EBAFF).withOpacity(0.5),
//                 ),
//                 child: const Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'Start',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Icon(Icons.arrow_forward, size: 20),
//                   ],
//                 ),
//               ),
              
//               const Spacer(flex: 2),
              
//               // الجزء السفلي (Powered by AI)
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.05),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: const Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     CircleAvatar(
//                       radius: 4,
//                       backgroundColor: Colors.greenAccent,
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       'POWERED BY RoboTech',
//                       style: TextStyle(
//                         color: Colors.white54,
//                         fontSize: 10,
//                         letterSpacing: 1.5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               const SizedBox(height: 20),
              
//               // شريط المؤشر السفلي الصغير
//               Container(
//                 width: 100,
//                 height: 2,
//                 color: Colors.white24,
//               ),
              
//               const SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:study_lamp/core/network/socket_service.dart';
import 'package:study_lamp/navigetorBar.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
 /// final SocketService socketService = SocketService();

  late AnimationController _controller;

  late Animation<double> logoScale;
  late Animation<double> fade;
  late Animation<Offset> titleSlide;
  late Animation<Offset> buttonSlide;

  @override
  void initState() {
    super.initState();

 

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    /// 🔥 Animations
    logoScale = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    fade = Tween<double>(begin: 0, end: 1).animate(_controller);

    titleSlide = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    buttonSlide = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [
              Color(0xFF1A233A),
              Color(0xFF0A0E14),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),

              /// 🔥 LOGO (Scale + Fade)
              FadeTransition(
                opacity: fade,
                child: ScaleTransition(
                  scale: logoScale,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.05),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.bubble_chart,
                        size: 60,
                        color: Color(0xFF8EBAFF),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// 🔥 TITLE (Slide from top)
              SlideTransition(
                position: titleSlide,
                child: FadeTransition(
                  opacity: fade,
                  child: const Column(
                    children: [
                      Text(
                        'MindFlow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        'ELEVATE YOUR FOCUS',
                        style: TextStyle(
                          color: Color(0xFF8EBAFF),
                          fontSize: 14,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 60),

              /// 🔥 BUTTON (Slide from bottom)
              SlideTransition(
                position: buttonSlide,
                child: FadeTransition(
                  opacity: fade,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (c) => MainScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8EBAFF),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 10,
                      shadowColor:
                          const Color(0xFF8EBAFF).withOpacity(0.5),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 2),

              /// 🔥 BOTTOM (Fade only)
              FadeTransition(
                opacity: fade,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.greenAccent,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'POWERED BY RoboTech',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 10,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 100,
                      height: 2,
                      color: Colors.white24,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}