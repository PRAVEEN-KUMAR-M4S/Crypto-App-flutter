part of 'crypto_bloc.dart';

@immutable
sealed class CryptoEvent {}

final class CryptoFetch extends CryptoEvent {}

final class CryptoFetchChart extends CryptoEvent {
  final String id;
  final String day;

  CryptoFetchChart({required this.id, required this.day});
}
