import 'package:crypto/core/color/hex_rgb.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final String title;
  final String suntitle;
  final String color;
  final String amount;
  final String image;
  const CoinCard(
      {super.key,
      required this.title,
      required this.suntitle,
      required this.color,
      required this.amount,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width*0.4,
     decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: hexToColor(color),),
     child: Padding(
       padding: const EdgeInsets.symmetric(horizontal:  25.0,vertical: 15),
       child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,children: [
        CircleAvatar(
          backgroundColor: Colors.yellow,
          radius: 25,
       
        ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        Text(suntitle,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
        ],
      ),
        Text(amount,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
       ],),
     ),
    );
  }
}
