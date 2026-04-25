import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FocusSessionSheet extends StatefulWidget {
  const FocusSessionSheet({super.key, required this.workValue1, this.onChanged});
final double workValue1;
final ValueChanged<double>? onChanged;
  @override
  State<FocusSessionSheet> createState() => _FocusSessionSheetState();
}

class _FocusSessionSheetState extends State<FocusSessionSheet> {
  double workValue = 25;
  double breakValue = 5;
  int cycles = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F26),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "New Focus Session",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          // Work Slider
          _buildSlider(
            title: "Work Duration",
            value:widget. workValue1,
            max: 60,
            color: const Color(0xFF7BAAF7),
            onChanged:   
              (v) {
              setState(() {
                workValue = v;
              });
            },
          ),

          const SizedBox(height: 25),

          // Break Slider
          _buildSlider(
            title: "Break Duration",
            value: breakValue,
            max: 30,
            color: const Color(0xFF81F495),
            onChanged: (v) {
              setState(() {
                breakValue = v;
              });
            },
          ),

          const SizedBox(height: 30),

          // Cycles
               const SizedBox(height: 30),

         // btm(),
        ],
      ),
    );
  }

  // Slider عادي
  Widget _buildSlider({
    required String title,
    required double value,
    required double max,
    required Color color,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title (${value.toInt()} min)",
          style: TextStyle(color: color, fontSize: 16),
        ),

        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: color,
            inactiveTrackColor: Colors.white10,
            thumbColor: Colors.white,
            trackHeight: 5,
          ),
          child: Slider(
            value: value,
            min: 0,
            max: max,
            divisions: max.toInt(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

