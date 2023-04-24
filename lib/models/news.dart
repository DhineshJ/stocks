 

import 'dart:convert';

StockNews welcomeFromJson(String str) => StockNews.fromJson(json.decode(str));

String welcomeToJson(StockNews data) => json.encode(data.toJson());

class StockNews {
    StockNews({
        required this.stocks,
    });

    List<Stock> stocks;

    factory StockNews.fromJson(Map<String, dynamic> json) => StockNews(
        stocks: List<Stock>.from(json["stocks"].map((x) => Stock.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "stocks": List<dynamic>.from(stocks.map((x) => x.toJson())),
    };
}

class Stock {
    Stock({
        required this.name,
        required this.description,
        required this.image,
    });

    String name;
    String description;
    String image;

    factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        name: json["name"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image,
    };
}
