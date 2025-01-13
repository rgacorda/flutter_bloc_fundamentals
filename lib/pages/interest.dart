import 'package:flutter/material.dart';

class InterestRateScreen extends StatelessWidget {
  final List<Map<String, String>> interestRates = [
    {'kind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
    {'kind': 'Corporate customers', 'deposit': '2m', 'rate': '5.50%'},
    {'kind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
    {'kind': 'Corporate customers', 'deposit': '6m', 'rate': '2.50%'},
    {'kind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
    {'kind': 'Corporate customers', 'deposit': '8m', 'rate': '6.50%'},
    {'kind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
    {'kind': 'Corporate customers', 'deposit': '7m', 'rate': '6.80%'},
    {'kind': 'Individual customers', 'deposit': '12m', 'rate': '5.90%'},
    {'kind': 'Individual customers', 'deposit': '1m', 'rate': '4.50%'},
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
          'Interest Rate',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Table header
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Interest kind',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Deposit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Rate',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8), // Add margin below the header
              // Table content
              Expanded(
                child: ListView.separated(
                  itemCount: interestRates.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    height: 16,
                  ),
                  itemBuilder: (context, index) {
                    final rate = interestRates[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              rate['kind']!,
                              style: TextStyle(
                                fontSize: 17.5
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              rate['deposit']!,
                              style: TextStyle(
                                fontSize: 17.5
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              rate['rate']!,
                              style: TextStyle(
                                color: Color(0xFF281C9D),
                                fontSize: 17.5
                              ),
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
