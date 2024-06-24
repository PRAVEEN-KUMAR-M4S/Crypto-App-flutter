import 'package:crypto/home/data/data_source/coin_market_data.dart';
import 'package:crypto/home/data/models/chart.dart';
import 'package:crypto/home/data/models/coin_market_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CoinMarketData _coinMarketData;
  CryptoBloc(this._coinMarketData) : super(CryptoInitial()) {
    on<CryptoEvent>((event, emit) => emit(CryptoLoading()));
    on<CryptoFetch>(_onFetchCrypto);
    on<CryptoFetchChart>(_onFetchChart);
  }

  void _onFetchCrypto(CryptoFetch event, Emitter<CryptoState> emit) async {
    try {
      final res = await _coinMarketData.getCoinMarket();
      emit(CryptoFetchSuccess(getCoinList: res));
    } catch (e) {
      emit(CryptoFailure(error: e.toString()));
    }
  }

  void _onFetchChart(CryptoFetchChart event, Emitter<CryptoState> emit) async {
    try {
      final res = await _coinMarketData.getChartData(event.id, event.day);
      if (res == null) {
        emit(CryptoFailure(
            error: 'So issues are on the network try again later.. !'));
      } else {
        emit(CryptoFetchChartSuccess(chartModel: res));
      }
    } catch (e) {
      emit(CryptoFailure(error: e.toString()));
    }
  }
}
