part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable{}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.coinsList});

  final List<CryptoCoin> coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class CryptoListLoadingWrong extends CryptoListState {
  CryptoListLoadingWrong({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
