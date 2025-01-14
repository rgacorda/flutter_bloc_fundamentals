import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/exchange_bloc.dart';
import 'package:flutterapp/bloc/exchange_event.dart';
import 'package:flutterapp/bloc/exchange_state.dart';
import 'package:flutterapp/data/currencies.dart';
class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}


class _ExchangeScreenState extends State<ExchangeScreen> {
  String _sourceCurr = 'USD';
  String _targetCurr = 'KRW';
  double _sourceRate = 1;
  double _targetRate = 0.85;



  Future<void> _showCurrencyDialog(String selectedCurrency, Function(String, double) onSelect) async {
    final String? selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Select the currency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          children: currencies.map((currency) {
            bool isSelected = currency['currency'] == selectedCurrency;
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, currency['currency']);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${currency['currency']} (${currency['name'] ?? ""})',
                      style: TextStyle(
                        fontSize: 17,
                        color: isSelected ? Color(0xFF281C9D) : Colors.grey,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    if (isSelected)
                      const Icon(
                        Icons.check,
                        color: Color(0xFF281C9D),
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );

    if (selected != null && selected != selectedCurrency) {
      final selectedCurrencyData = currencies.firstWhere(
            (currency) => currency['currency'] == selected,
      );
      double selectedRate = selectedCurrencyData['rate'];
      onSelect(selected, selectedRate);
    }
  }


  @override
  Widget build(BuildContext context) {
    final exchangeBloc = context.read<ExchangeBloc>();
    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Exchange',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/exchange_header.png',
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),

              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'From',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      // From input
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Row(
                          children: [
                            // Input Field for Amount
                            Expanded(
                              child: TextField(
                                controller: textController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Amount',
                                  hintStyle: TextStyle(fontSize: 16),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            // Divider between the input field and the button
                            Container(
                              width: 1,
                              color: Colors.grey[300], // Divider color
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                            ),
                            // Currency Selection Button
                            GestureDetector(
                              onTap: () {
                                _showCurrencyDialog(
                                  _sourceCurr,
                                      (selected, selectedRate) {
                                    setState(() {
                                      _sourceCurr = selected;
                                      _sourceRate = selectedRate;
                                    });
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    _sourceCurr,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  const Icon(Icons.arrow_drop_down, color: Colors.black),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Swap arrows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.arrow_downward,
                            color: Color(0xFF281C9D),
                            size: 36,
                          ),
                          Icon(
                            Icons.arrow_upward,
                            color: Color(0xFFFF4267),
                            size: 36,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'To',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      // To input
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: BlocBuilder<ExchangeBloc, ExchangeState>(
                                builder: (context, state) {
                                  return TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: state.result?.toStringAsFixed(2) ?? 'Amount',
                                      hintStyle: TextStyle(fontSize: 16),
                                    ),
                                  );
                                }
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                _showCurrencyDialog(
                                  _targetCurr,
                                      (selected, selectedRate) {
                                    setState(() {
                                      _targetCurr = selected;
                                      _targetRate = selectedRate;
                                    });
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    _targetCurr,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  const Icon(Icons.arrow_drop_down, color: Colors.black),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Currency rate
                      Row(
                        children: [
                          Text(
                              'Currency rate',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF281C9D),
                              ),
                            ),
                          Spacer(),
                          Text(
                            '${_sourceRate} ${_sourceCurr} = ${_targetRate} ${_targetCurr}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Exchange button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF281C9D),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            double amount = double.parse(textController.text);
                            exchangeBloc.add(ConvertCurrency(sourceCurrency: _sourceRate, targetCurrency: _targetRate, amount: amount ));
                          },
                          child: const Text(
                            'Exchange',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
