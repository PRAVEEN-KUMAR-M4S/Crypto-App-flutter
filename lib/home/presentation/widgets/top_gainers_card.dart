import 'package:crypto/core/color/hex_rgb.dart';
import 'package:flutter/material.dart';

class TopGainersCard extends StatelessWidget {
  const TopGainersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        
        color: Colors.black.withOpacity(0.8),
        
       
      ),
      child: Row(
        children: [
          Container(height: 30,width: 30,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),color: hexToColor('#E6EEF7'),
          ),
          child: Center(child: Icon(Icons.ac_unit),),)
        ],
      ),
    );
  }
}
