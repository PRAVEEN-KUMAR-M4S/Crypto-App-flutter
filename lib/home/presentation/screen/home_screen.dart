import 'package:crypto/core/utils/snack_bar.dart';
import 'package:crypto/home/presentation/bloc/crypto_bloc.dart';
import 'package:crypto/home/presentation/screen/view_all_items.dart';
import 'package:crypto/home/presentation/screen/view_chart.dart';
import 'package:crypto/home/presentation/widgets/appbar_icon.dart';
import 'package:crypto/home/presentation/widgets/bigg_card.dart';
import 'package:crypto/home/presentation/widgets/coin_card.dart';
import 'package:crypto/home/presentation/widgets/item_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<CryptoBloc>().add(CryptoFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
          child: BlocConsumer<CryptoBloc, CryptoState>(
        listener: (context, state) {
          if (state is CryptoFailure) {
            return showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is CryptoLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is CryptoFetchSuccess) {
            print(state.getCoinList[0].symbol);
            return Padding(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$76,050.00',
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.w900),
                              textWidthBasis: TextWidthBasis.parent,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Active Balance',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 25,
                          width: 30,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                            'assets/graph.png',
                          ))),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          '\$2300.00',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CardWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Market Places',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'View all',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CoinCard(
                          ontap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewChart(coinModel: state.getCoinList[0]))),
                            title: state.getCoinList[0].name,
                            suntitle: state.getCoinList[0].symbol.toUpperCase(),
                            color: '#F5F0E3',
                            amount: state.getCoinList[0].currentPrice,
                            image: state.getCoinList[0].image),
                        CoinCard(
                           ontap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewChart(coinModel: state.getCoinList[1]))),
                            title: state.getCoinList[1].name,
                            suntitle: state.getCoinList[1].symbol.toUpperCase(),
                            color: '#E6EEF7',
                            amount: state.getCoinList[1].currentPrice,
                            image: state.getCoinList[1].image),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Top Gainers',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewAllItems(coinModel: state.getCoinList))),
                          child: const Text(
                            'View all',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            final data = state.getCoinList[index];
                            return GestureDetector(
                              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewChart(coinModel: data))),
                              child: ItemContainer(
                                coinModel: data,
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      )),
    );
  }
}
