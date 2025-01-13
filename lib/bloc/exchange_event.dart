abstract class ExchangeEvent {}

class ExchangePressed extends ExchangeEvent {}

class DisplayResult extends ExchangeEvent {}

class ConvertCurrency extends ExchangeEvent {
  final double sourceCurrency;
  final double targetCurrency;
  final double amount;

  ConvertCurrency({
    required this.sourceCurrency,
    required this.targetCurrency,
    required this.amount
  });
}
