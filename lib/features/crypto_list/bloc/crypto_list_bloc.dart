import 'dart:async';
import 'package:crypto_app/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async{
      try {
        if (state is! CryptoListLoaded){
          emit(CryptoListLoading());
        }
        final coinsList = await coinRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingWrong(exception: e));
      }
      finally {
        event.compleater?.complete();
      }
    });
  }
  final CryptoCoinsRepository coinRepository;
}
