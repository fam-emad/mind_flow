import 'package:flutter/material.dart';

class Cycles extends StatefulWidget {
  // 👇 ضيف السطر ده: دالة بناديها لما الرقم يتغير
  final Function(int) onChanged;
  final int initialValue;

  const Cycles({super.key, required this.onChanged, this.initialValue = 4});

  @override
  State<Cycles> createState() => _CyclesState();
}

class _CyclesState extends State<Cycles> {
  late int cycles;

  @override
  void initState() {
    super.initState();
    cycles = widget.initialValue; // نبدأ بالقيمة اللي جاية من بره
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Number of Cycles", style: TextStyle(color: Colors.white, fontSize: 16)),
            Text("Consecutive sessions", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (cycles > 1) {
                  setState(() => cycles--);
                  widget.onChanged(cycles); // 📣 بلغ اللي بره بالرقم الجديد
                }
              },
              icon: const Icon(Icons.remove, color: Colors.white),
            ),
            Text("$cycles", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            IconButton(
              onPressed: () {
                setState(() => cycles++);
                widget.onChanged(cycles); // 📣 بلغ اللي بره بالرقم الجديد
              },
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}