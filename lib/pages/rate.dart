import 'package:flutter/material.dart';

class RateScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exchangeRates = [
    {'country': 'Vietnam', 'flag': 'assets/flags/vietnam.png', 'buy': '1.403', 'sell': '1.746'},
    {'country': 'Nicaragua', 'flag': 'assets/flags/nicaragua.png', 'buy': '9.123', 'sell': '12.09'},
    {'country': 'Korea', 'flag': 'assets/flags/korea.png', 'buy': '3.704', 'sell': '5.151'},
    {'country': 'Russia', 'flag': 'assets/flags/russia.png', 'buy': '116.0', 'sell': '144.4'},
    {'country': 'China', 'flag': 'assets/flags/china.png', 'buy': '1.725', 'sell': '2.234'},
  ];

  @override
  Widget build(BuildContext context) {
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
          'Exchange Rate',
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Table header
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Country',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Buy',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Sell',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8), // Space between header and content
              // Table content
              Expanded(
                child: ListView.separated(
                  itemCount: exchangeRates.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    height: 16,
                  ),
                  itemBuilder: (context, index) {
                    final rate = exchangeRates[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.5),
                      child: Row(
                        children: [
                          // Country column with flag
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: Image.asset(
                                    rate['flag'],
                                    height: 40,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    rate['country'],
                                    style: TextStyle(fontSize: 17.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Buy column
                          Expanded(
                            flex: 2,
                            child: Text(
                              rate['buy'],
                              style: TextStyle(fontSize: 17.5),
                            textAlign: TextAlign.right,
                            ),
                          ),
                          // Sell column
                          Expanded(
                            flex: 2,
                            child: Text(
                              rate['sell'],
                              style: TextStyle(fontSize: 17.5),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
