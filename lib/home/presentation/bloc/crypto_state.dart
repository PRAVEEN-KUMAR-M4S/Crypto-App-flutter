part of 'crypto_bloc.dart';

@immutable
sealed class CryptoState {}

final class CryptoInitial extends CryptoState {}

final class CryptoFetchSuccess extends CryptoState {
  final List<CoinModel> getCoinList;

  CryptoFetchSuccess({required this.getCoinList});
}

final class CryptoFailure extends CryptoState {
  final String error;

  CryptoFailure({required this.error});
}

final class CryptoLoading extends CryptoState {}

final class CryptoFetchChartSuccess extends CryptoState {
  final List<ChartModel> chartModel;

  CryptoFetchChartSuccess({required this.chartModel});
}
