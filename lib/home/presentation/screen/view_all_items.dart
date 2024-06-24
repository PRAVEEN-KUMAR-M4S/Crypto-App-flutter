import 'package:crypto/home/data/models/coin_market_model.dart';
import 'package:crypto/home/presentation/screen/view_chart.dart';
import 'package:crypto/home/presentation/widgets/item_container.dart';
import 'package:flutter/material.dart';

class ViewAllItems extends StatelessWidget {
  final List<CoinModel> coinModel;
  const ViewAllItems({super.key, required this.coinModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View All Stocks ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
            itemCount: coinModel.length,
            itemBuilder: (context, index) {
              final data = coinModel[index];
              return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewChart(coinModel: data))),
                  child: ItemContainer(coinModel: data));
            }),
      ),
    );
  }
}
