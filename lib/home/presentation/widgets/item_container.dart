import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:crypto/core/color/hex_rgb.dart';
import 'package:crypto/home/data/models/coin_market_model.dart';
import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  final CoinModel coinModel;
  const ItemContainer({super.key, required this.coinModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // shadow color
            spreadRadius: 1, // spread radius
            blurRadius: 5, // blur radius
            offset:
                const Offset(0, 3), // changes position of shadow to the bottom
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: hexToColor('#E6EEF7'),
                  ),
                  child: Center(
                    child: Image.network(coinModel.image),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 85,
                        child: Text(
                          coinModel.name,
                          style:
                              const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Text(
                        coinModel.symbol.toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 20,),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Sparkline(
                    data: coinModel.sparklineIn7D.price,
                    lineWidth: 2,
                    lineColor:coinModel.marketCapChangePercentage24H >=0? Colors.green:  Colors.red,
                    fillMode: FillMode.below,
                    fillGradient: LinearGradient(
                      colors:coinModel.marketCapChangePercentage24H >=0? [Colors.green,Colors.green.shade100]: [Colors.red, Colors.red.shade100],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [  0.0,0.7]
                    ),
                  ),
                )
              ],
            ),
            Text('\$${coinModel.currentPrice}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
