import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value; // 0.0 a 1.0

  const ProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${(value * 100).toStringAsFixed(3)}%",
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation(Color(0xFF755A20)),
          ),
        ),
      ],
    );
  }
}
