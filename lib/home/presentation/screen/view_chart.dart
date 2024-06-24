import 'package:crypto/core/color/hex_rgb.dart';
import 'package:crypto/core/utils/snack_bar.dart';
import 'package:crypto/home/data/models/chart.dart';
import 'package:crypto/home/data/models/coin_market_model.dart';
import 'package:crypto/home/presentation/bloc/crypto_bloc.dart';
import 'package:crypto/home/presentation/screen/home_screen.dart';
import 'package:crypto/home/presentation/widgets/appbar_icon.dart';
import 'package:crypto/home/presentation/widgets/custom_buttom.dart';
import 'package:crypto/home/presentation/widgets/low_mid_high.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ViewChart extends StatefulWidget {
  final CoinModel coinModel;
  const ViewChart({
    super.key,
    required this.coinModel,
  });

  @override
  State<ViewChart> createState() => _ViewChartState();
}

class _ViewChartState extends State<ViewChart> {
  late TrackballBehavior trackballBehavior;

  List<String> text = ['D', 'W', 'M', '3M', '6M','Y'];

  List<bool> textBool = [false, false, true, false, false,false];

  int day = 30;

  setday(String txt) {
    if (txt == 'D') {
      setState(() {
        day = 1;
      });
    } else if (txt == 'W') {
      setState(() {
        day = 7;
      });
    } else if (txt == 'M') {
      setState(() {
        day = 30;
      });
    } else if (txt == '3M') {
      setState(() {
        day = 90;
      });
    } else if (txt == '6M') {
      setState(() {
        day = 180;
      });
    } else if (txt == 'Y') {
      setState(() {
        day = 365;
      });
    }
  }

  @override
  void initState() {
    context
        .read<CryptoBloc>()
        .add(CryptoFetchChart(id: widget.coinModel.id, day: day.toString()));
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (_) => false),
                        child:
                            const AppbarIcon(iconData: Icons.arrow_back_ios)),
                     Text(
                    widget.coinModel.name  ,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const AppbarIcon(iconData: Icons.search)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(widget.coinModel.image),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.coinModel.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(widget.coinModel.symbol.toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey))
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$ ${widget.coinModel.currentPrice}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.coinModel.marketCapChangePercentage24H.toString(),
                          style: TextStyle(color: widget.coinModel.marketCapChangePercentage24H>=0?Colors.green: Colors.red),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: hexToColor('#F5F0E3'),
                      borderRadius: BorderRadius.circular(12)),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LowMidHigh(text: 'low', data: widget.coinModel.low24H.toString()),
                      LowMidHigh(text: 'high', data: widget.coinModel.high24H.toString()),
                      LowMidHigh(text: 'Vol', data: widget.coinModel.totalVolume.toString())
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocConsumer<CryptoBloc, CryptoState>(
                  listener: (context, state) {
                    if (state is CryptoFailure) {
                      return showSnackBar(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is CryptoLoading) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                    if (state is CryptoFetchChartSuccess) {
                      return Column(
                        children: [
                          Container(
                            height: 300,
                            width: double.infinity,
                            
                            child: SfCartesianChart(
                              trackballBehavior: trackballBehavior,
                              zoomPanBehavior: ZoomPanBehavior(
                                  enablePanning: true, zoomMode: ZoomMode.x),
                              series: <CandleSeries>[
                                CandleSeries<ChartModel, int>(
                                    enableSolidCandles: true,
                                    enableTooltip: true,
                                    bullColor: Colors.green,
                                    bearColor: Colors.red,
                                    dataSource: state.chartModel,
                                    xValueMapper: (ChartModel sales, _) =>
                                        sales.time,
                                    lowValueMapper: (ChartModel sales, _) =>
                                        sales.low,
                                    highValueMapper: (ChartModel sales, _) =>
                                        sales.high,
                                    openValueMapper: (ChartModel sales, _) =>
                                        sales.open,
                                    closeValueMapper: (ChartModel sales, _) =>
                                        sales.close)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: hexToColor('#F5F0E3'),
                                  borderRadius: BorderRadius.circular(5)),
                              child: ListView.builder(
                                  itemCount: text.length,
                                 
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            textBool = [
                                              false,
                                              false,
                                              false,
                                              false,
                                              false,
                                              false
                                            ];
                                            textBool[index] = true;
                                            setday(text[index]);
                                          });
                              
                                          
                                          context.read<CryptoBloc>().add(
                                              CryptoFetchChart(
                                                  id: widget.coinModel.id,
                                                  day: day.toString()));
                              
                                          // initState();
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: textBool[index] == true
                                                  ? hexToColor('#6CA1FF')
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Center(
                                            child: Text(
                                              text[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                        ],
                      );
                    }
                    return const Center(
                        child: Text('Not able to Load the chart'));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: hexToColor('#E6EEF7'),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Trading BitCoin',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              '67 % people',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Image.asset('assets/img2.png')
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                const Text('About Crypto Coins',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 18),),
                const SizedBox(height: 5,),
                const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey,),),
                const SizedBox(height: 20,),
                const CustomButtom(text: "Buy")


              ],
            ),
          ),
        ),
      ),
    );
  }
}
