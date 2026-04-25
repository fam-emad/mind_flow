import 'package:flutter/material.dart';
import 'package:study_lamp/core/app_colors.dart';

class Slider1 extends StatelessWidget {
  const Slider1({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.onChanged,
  });

  final String title;
  final double value;
  final Color color;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 16,
              ),
            ),
            Text(
              '${value.toStringAsFixed(0)}m',
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 6,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
            activeTrackColor: color,
            inactiveTrackColor: Colors.white10,
            thumbColor: Colors.white,
          ),
          child: Slider(min: 0, max: 60, value: value, onChanged: onChanged,divisions: 60,),
        ),
      ],
    );
    ;
  }
}
