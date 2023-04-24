import 'package:flutter/material.dart';

import 'Views/home_page.dart';
import 'bloc/stock_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mockClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => StockBloc(MockDataSource())
          ..add(MarketListingEvent())
          ..add(StockListingEvent()),
        child: const MyHomePage(title: 'Portfolio'),
      ),
    );
  }
}
