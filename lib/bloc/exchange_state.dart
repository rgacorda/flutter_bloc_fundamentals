class ExchangeState {
  final double result;

  ExchangeState({
    this.result = 0.0,
  });

  ExchangeState copyWith({
    double? result,
  }) {
    return ExchangeState(
      result: result ?? this.result,
    );
  }
}
