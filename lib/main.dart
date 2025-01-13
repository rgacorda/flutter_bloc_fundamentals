import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc/exchange_bloc.dart';
import 'package:flutterapp/pages/exchange.dart';
import 'package:flutterapp/pages/home.dart';
import 'package:flutterapp/pages/interest.dart';
import 'package:flutterapp/pages/rate.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ExchangeBloc(),)
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/interest': (context) => InterestRateScreen(),
          '/rate': (context) => RateScreen(),
          '/exchange': (context) => ExchangeScreen(),
        },
      ),
  ));
}

