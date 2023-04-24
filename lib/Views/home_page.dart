 
import 'package:flutter/material.dart';
import 'package:stocks/Views/sector_performance.dart';
import 'package:stocks/Views/stock_details.dart';
import 'package:stocks/Views/stock_news.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/stock_bloc_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100,
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Sector Performance"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Latest News"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              BlocProvider.of<StockBloc>(context)
                  .add(SectorPermformanceEvent());
            } else {
              if (value == 1) {
                BlocProvider.of<StockBloc>(context).add(StockNewsEvent());
              }
            }
          })
        ],
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const Text('May 21')
          ],
        ),
      ),
      body: BlocListener<StockBloc, StockBlocState>(
        listener: (context, state) {
          if (state is SectorListedState) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SectorPerformance(sector: state.sector);
            }));
          }
          if (state is StockNewsState) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return StockNewsInfo(stockNews: state.stockNews);
            }));
          }
        },
        child: Column(
          children: [
            SizedBox(
              height: 110,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: BlocBuilder<StockBloc, StockBlocState>(
                      buildWhen: (previous, current) =>
                          current is MarkedListedState,
                      builder: (context, state) {
                        if (state is MarkedListedState) {
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.market.data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        state.market.data[index].symbol,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        double.parse(
                                                state.market.data[index].ltp)
                                            .toStringAsFixed(2),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      if (double.parse(state.market.data[index].chg).toInt() > 0)
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<Color>(
                                                        Colors.green)),
                                            onPressed: () {},
                                            child: Text(
                                                double.parse(state.market.data[index].chg)
                                                    .toStringAsFixed(2)))
                                      else
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.red)),
                                            onPressed: () {},
                                            child: Text(double.parse(state.market.data[index].chg).toStringAsFixed(2)))
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Text("HARD core");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<StockBloc, StockBlocState>(
                buildWhen: (previous, current) {
                  return current is StockListedState;
                },
                builder: (context, state) {
                  if (state is StockListedState) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const Divider(height: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return StockDetails(
                                      datum: state.stocks.data[index]);
                                },
                              ));
                            },
                            child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Row(
                                    children: [
                                      Text(state.stocks.data[index].symbol,
                                          style: const TextStyle(
                                              color: Colors.white)),
                                      const Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Column(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  backgroundColor: double.parse(
                                                              state
                                                                  .stocks
                                                                  .data[index]
                                                                  .chgp) >
                                                          0
                                                      ? MaterialStateProperty
                                                          .all<Color>(
                                                              Colors.green)
                                                      : MaterialStateProperty
                                                          .all<Color>(
                                                              Colors.red)),
                                              child: Text(
                                                  state.stocks.data[index].chgp,
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                            ),
                                            Text(state.stocks.data[index].ltp,
                                                style: const TextStyle(
                                                    color: Colors.white))
                                          ],
                                        ),
                                      ),
                                    ],

                                    // Text('s')
                                  ),
                                )),
                          );
                        },
                        itemCount: state.stocks.data.length,
                      ),
                    );
                  } else {
                    return const Text('Issue in fetching stocks');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
