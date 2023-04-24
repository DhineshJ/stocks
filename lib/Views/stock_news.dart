import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/news.dart';

class StockNewsInfo extends StatelessWidget {
  const StockNewsInfo({super.key, required this.stockNews});
  final StockNews stockNews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Latest News'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StockName(stockName: "Google"),
            NewsList(stockNews: stockNews),
            const StockName(stockName: "HDFC"),
            NewsList(stockNews: stockNews),
          ],
        ),
      ),
    );
  }
}

class StockName extends StatelessWidget {
  const StockName({
    super.key,
    required this.stockName,
  });
  final String stockName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Text(
        stockName,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.stockNews,
  });

  final StockNews stockNews;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(15)),
      height: 270,
      child: ListView.separated(
        itemCount: stockNews.stocks.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              NewsWidget(
                stockDescription: stockNews.stocks[index].description,
                stockImage: stockNews.stocks[index].image,
              ),
               
            ],
          );
        },
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget(
      {super.key, v, required this.stockDescription, required this.stockImage});

  final String stockDescription;
  final String stockImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 100,
              width: 200,
              child: Text(
                stockDescription,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              )),
          SizedBox(
              height: 150,
              width: 200,
              child: Image.network(stockImage, fit: BoxFit.fill))
        ],
      ),
    );
  }
}
