import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/exchange_event.dart';
import 'package:flutterapp/bloc/exchange_state.dart';
import 'package:flutterapp/data/currencies.dart';


class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  ExchangeBloc() : super(ExchangeState()) {
    on<ConvertCurrency>((event, emit){
      double target = event.targetCurrency;
      double source = event.sourceCurrency;
      double amount = event.amount;

      double result = (amount / source) * target;
      emit(state.copyWith(result: result));
    });
  }
}
