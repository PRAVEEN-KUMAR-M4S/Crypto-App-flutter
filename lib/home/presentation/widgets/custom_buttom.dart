import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  const CustomButtom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 218, 8),
          borderRadius: BorderRadius.circular(18)),
      child:  Center(
          child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      )),
    );
  }
}
