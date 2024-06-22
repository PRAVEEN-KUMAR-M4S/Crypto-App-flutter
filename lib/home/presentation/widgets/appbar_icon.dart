import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarIcon extends StatelessWidget {
  final IconData iconData;
  const AppbarIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: const Color.fromARGB(255, 78, 74, 74), width: 0.1)),
      child: Center(
          child: Icon(
        iconData,
        color: Colors.grey,
        size: 18,
      )),
    );
  }
}
