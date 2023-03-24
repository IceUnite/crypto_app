import 'dart:async';

import 'package:crypto_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_app/features/crypto_list/widgets/crypto_coin_list.dart';
import 'package:crypto_app/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:crypto_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinList;

  final _cryptoListBloc = CryptoListBloc(CryptoCoinsRepository());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto app'),
      ),
      body: RefreshIndicator(
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        onRefresh: () async {
          final compleater = Completer();
          _cryptoListBloc.add(LoadCryptoList(compleater: compleater));
          return compleater.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                padding: EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final coin = state.coinsList[index];
                  return CryptoCoinTile(
                    coin: coin,
                  );
                },
              );
            }
            if (state is CryptoListLoadingWrong) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: darkTheme.textTheme.bodyMedium,
                    ),
                    Text(
                      'Plese try again later',
                      style: darkTheme.textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        _cryptoListBloc.add(LoadCryptoList());
                      },
                      child: Text('Try again'),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
