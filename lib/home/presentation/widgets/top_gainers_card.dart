import 'package:crypto/home/data/models/coin_market_model.dart';
import 'package:crypto/home/presentation/widgets/item_container.dart';
import 'package:flutter/material.dart';

class TopGainersCard extends StatelessWidget {
  final List<CoinModel> item;
  const TopGainersCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          final data = item[index];
          return ItemContainer(coinModel: data,);
        });
  }
}
