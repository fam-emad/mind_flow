import 'package:flutter/material.dart';
import 'package:study_lamp/pages/state/views/state_re.dart';

/// =============================
/// ADVICE ENGINE
/// =============================
String getAdvice(String state) {
   switch (state.toLowerCase()) {
    case "focused":
     
      return "You are in a focused state. Keep it stable by removing distractions, silencing notifications, and working in short deep-work cycles (25–45 minutes). Try to avoid switching tasks frequently to maintain flow.";

    case "stressed":
      return "You seem stressed. Pause for a few minutes, take slow deep breaths, and step away from the task briefly. Break your work into smaller steps instead of handling everything at once, and return with a clearer mindset.";

    case "tired":
      return "You are feeling tired. Your productivity will improve if you take a proper rest, hydrate, and do lighter tasks for a while. Avoid forcing heavy concentration work when your energy is low.";

    case "happy":
      return "You are in a positive state. This is the best time to handle creative or challenging tasks. Try to channel this energy into productive work while maintaining balance so you don’t burn out later.";

    case "angry":
      return "You seem frustrated. Stop for a moment before continuing. Avoid making decisions or writing code while in this state. Take a short break to reset your emotions and return with a calmer mindset.";

    case "surprised":
      return "Your workflow seems unstable or unpredictable. Try to organize your tasks, set clear priorities, and avoid multitasking. Stability will help you regain control of your focus.";

    default:
      return "Keep tracking your flow consistently. Try to observe your patterns and adjust your work habits based on your energy and focus levels throughout the day.";
  }

}

/// =============================
/// SAFE TOP STATE CALCULATION
/// =============================
 

/// =============================
/// ADVA WIDGET (UI ثابت 100% كما هو)
/// =============================
class Adva extends StatelessWidget {
  final String source;

  const Adva({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
   // final safeSource = source.where((e) => e is Map).toList();

   // final topState = getTopState(safeSource);
   
 final adviceText = getAdvice(source);
    return Container(
      padding: const EdgeInsets.all(16),
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0F172A),
            Color(0xFF020617),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 81, 65, 71).withOpacity(0.25),
            blurRadius: 80,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ICON
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.05),
              border: Border.all(color: Colors.white12),
            ),
            child: const Icon(
              Icons.auto_awesome,
              color: Color(0xFFA855F7),
              size: 22,
            ),
          ),

          const SizedBox(width: 16),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "AI FLOW INSIGHT",
                  style: TextStyle(
                    color: Color(0xFFA855F7),
                    fontSize: 12,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  adviceText,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}