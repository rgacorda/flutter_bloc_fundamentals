import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> options = [
    {
      'title': 'Branch',
      'subtitle': 'Search for branch',
      'image': 'assets/branch.png',
      'route': '/'
    },
    {
      'title': 'Interest rate',
      'subtitle': 'Search for interest rate',
      'image': 'assets/interest.png',
      'route': '/interest'
    },
    {
      'title': 'Exchange rate',
      'subtitle': 'Search for exchange rate',
      'image': 'assets/rate.png',
      'route': '/rate'
    },
    {
      'title': 'Exchange',
      'subtitle': 'Exchange amount of money',
      'image': 'assets/exchange.png',
      'route': '/exchange'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Search',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),

      body: Container(
        color: Colors.white60,
        child: ListView.builder(
          itemCount: options.length,
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final option = options[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, option['route']!);
              },
              child: Card(
                margin: EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              option['title']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              option['subtitle']!,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Image.asset(
                        option['image']!,
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: GNav(
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 900), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: Colors.white, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: Color(0xFF281C9D), // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // navigation bar padding
          tabMargin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: CupertinoIcons.search,
              text: 'Search',),
            GButton(
              icon: CupertinoIcons.mail,
              text: 'Mail',),
            GButton(
              icon: Icons.settings,
              text: 'Settings',)
          ],
        ),
      )
    );
  }
}