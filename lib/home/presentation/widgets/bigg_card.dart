import 'package:crypto/core/color/hex_rgb.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: hexToColor('#E6EEF7'),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Beginner\'s Guid',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
               SizedBox(height: 5,),
                Text('Learn how to get started',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                SizedBox(height: 20,),
              
                Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: hexToColor('#FEBB39')),
                  child: Center(child: Text('LEARN MORE',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white60),)),
                )
              ],
            ),
          ),
          ClipRRect(child: Image.asset('assets/img1.png'))
        ],
      ),
    );
  }
}
