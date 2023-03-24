part of 'crypto_list_bloc.dart';

abstract class CryptoListEvent extends Equatable{}

class LoadCryptoList extends CryptoListEvent {
  LoadCryptoList({
    this.compleater,
  });

  final Completer? compleater;

  @override
  // TODO: implement props
  List<Object?> get props => [compleater];
}
