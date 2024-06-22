import 'package:crypto/home/presentation/widgets/appbar_icon.dart';
import 'package:crypto/home/presentation/widgets/bigg_card.dart';
import 'package:crypto/home/presentation/widgets/coin_card.dart';
import 'package:crypto/home/presentation/widgets/top_gainers_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/11.PNG'),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Hello Jasson',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      AppbarIcon(
                        iconData: CupertinoIcons.search,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      AppbarIcon(
                        iconData: CupertinoIcons.qrcode_viewfinder,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
             
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$76,050.00',style:  TextStyle(fontSize: 36,fontWeight: FontWeight.w900),textWidthBasis: TextWidthBasis.parent,),
                      SizedBox(height: 5,),
                      Text('Active Balance',style: TextStyle(color: Colors.grey),),
                   
                    ],
                  ),
                  const SizedBox(width: 30,),
                      Container(
                    height: 25,
                    width: 30,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/graph.png',))),
                    
                  ),
                  const SizedBox(width: 7,),
                  const Text('\$2300.00',style: TextStyle(fontSize: 18,color: Colors.green,fontWeight: FontWeight.w600),)
                 
                ],
              ),
              const SizedBox(height: 20,),
              const CardWidget(),
              const SizedBox(height: 20,),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Market Places',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                 Text('View all',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),)
              ],),
              const SizedBox(height: 20,),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                CoinCard(title: 'Bitcoin', suntitle: 'BTC', color: '#F5F0E3', amount: '37,760.00', image: ''),
               CoinCard(title: 'Bitcoin', suntitle: 'BTC', color: '#F5F0E3', amount: '37,760.00', image: '')
              ],),
              const SizedBox(height: 15,),
               const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Top Gainers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                 Text('View all',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),)
              ],),
              SizedBox(height: 10,),
              const TopGainersCard()
            ],
          ),
        ),
      )),
    );
  }
}
