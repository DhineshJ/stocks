// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Sector welcomeFromJson(String str) => Sector.fromJson(json.decode(str));

String welcomeToJson(Sector data) => json.encode(data.toJson());

class Sector {
    Sector({
        required this.data,
    });

    List<Datum> data;

    factory Sector.fromJson(Map<String, dynamic> json) => Sector(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.sector,
        required this.percentage,
    });

    String sector;
    double percentage;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        sector: json["sector"],
        percentage: json["percentage"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "sector": sector,
        "percentage": percentage,
    };
}
