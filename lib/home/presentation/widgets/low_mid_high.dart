import 'package:flutter/material.dart';

class LowMidHigh extends StatelessWidget {
  final String text;
  final String data;

  const LowMidHigh({super.key, required this.text, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Text(
          data,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
