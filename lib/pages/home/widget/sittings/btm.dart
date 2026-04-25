import 'package:flutter/material.dart';

class btm extends StatelessWidget {
  const btm({
    super.key, required this.ontap,
  });
final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed:ontap ,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF89B4FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          "Start Session",
          style: TextStyle(
            color: Color(0xFF002E6E),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}