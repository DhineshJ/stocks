// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Stocks welcomeFromJson(String str) => Stocks.fromJson(json.decode(str));

String welcomeToJson(Stocks data) => json.encode(data.toJson());

class Stocks {
    Stocks({
        required this.declines,
        required this.data,
        required this.trdVolumesum,
        required this.latestData,
        required this.advances,
        required this.unchanged,
        required this.trdValueSumMil,
        required this.time,
        required this.trdVolumesumMil,
        required this.trdValueSum,
    });

    int declines;
    List<Datum> data;
    String trdVolumesum;
    List<LatestDatum> latestData;
    int advances;
    int unchanged;
    String trdValueSumMil;
    String time;
    String trdVolumesumMil;
    String trdValueSum;

    factory Stocks.fromJson(Map<String, dynamic> json) => Stocks(
        declines: json["declines"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        trdVolumesum: json["trdVolumesum"],
        latestData: List<LatestDatum>.from(json["latestData"].map((x) => LatestDatum.fromJson(x))),
        advances: json["advances"],
        unchanged: json["unchanged"],
        trdValueSumMil: json["trdValueSumMil"],
        time: json["time"],
        trdVolumesumMil: json["trdVolumesumMil"],
        trdValueSum: json["trdValueSum"],
    );

    Map<String, dynamic> toJson() => {
        "declines": declines,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "trdVolumesum": trdVolumesum,
        "latestData": List<dynamic>.from(latestData.map((x) => x.toJson())),
        "advances": advances,
        "unchanged": unchanged,
        "trdValueSumMil": trdValueSumMil,
        "time": time,
        "trdVolumesumMil": trdVolumesumMil,
        "trdValueSum": trdValueSum,
    };
}

class Datum {
    Datum({
        required this.symbol,
        required this.ss,
        required this.exchange,
        required this.type,
        required this.holdings,
        required this.open,
        required this.high,
        required this.low,
        required this.ltp,
        required this.ptsC,
        required this.chgp,
        required this.trdVol,
        required this.trdVolM,
        required this.ntP,
        required this.mVal,
        required this.wkhi,
        required this.wklo,
        required this.wkhicmAdj,
        required this.wklocmAdj,
        required this.xDt,
        required this.cAct,
        required this.previousClose,
        required this.dayEndClose,
        required this.iislPtsChange,
        required this.iislPercChange,
        required this.yPc,
        required this.mPc,
    });

    String symbol;
    String ss;
    Exchange exchange;
    Type type;
    String holdings;
    String open;
    String high;
    String low;
    String ltp;
    String ptsC;
    String chgp;
    String trdVol;
    String trdVolM;
    String ntP;
    String mVal;
    String wkhi;
    String wklo;
    String wkhicmAdj;
    String wklocmAdj;
    String xDt;
    String cAct;
    String previousClose;
    DayEndClose dayEndClose;
    String iislPtsChange;
    String iislPercChange;
    String yPc;
    String mPc;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        symbol: json["symbol"],
        ss: json["ss"],
        exchange: exchangeValues.map[json["exchange"]]!,
        type: typeValues.map[json["type"]]!,
        holdings: json["holdings"],
        open: json["open"],
        high: json["high"],
        low: json["low"],
        ltp: json["ltp"],
        ptsC: json["ptsC"],
        chgp: json["chgp"],
        trdVol: json["trdVol"],
        trdVolM: json["trdVolM"],
        ntP: json["ntP"],
        mVal: json["mVal"],
        wkhi: json["wkhi"],
        wklo: json["wklo"],
        wkhicmAdj: json["wkhicm_adj"],
        wklocmAdj: json["wklocm_adj"],
        xDt: json["xDt"],
        cAct: json["cAct"],
        previousClose: json["previousClose"],
        dayEndClose: dayEndCloseValues.map[json["dayEndClose"]]!,
        iislPtsChange: json["iislPtsChange"],
        iislPercChange: json["iislPercChange"],
        yPc: json["yPC"],
        mPc: json["mPC"],
    );

    Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "ss": ss,
        "exchange": exchangeValues.reverse[exchange],
        "type": typeValues.reverse[type],
        "holdings": holdings,
        "open": open,
        "high": high,
        "low": low,
        "ltp": ltp,
        "ptsC": ptsC,
        "chgp": chgp,
        "trdVol": trdVol,
        "trdVolM": trdVolM,
        "ntP": ntP,
        "mVal": mVal,
        "wkhi": wkhi,
        "wklo": wklo,
        "wkhicm_adj": wkhicmAdj,
        "wklocm_adj": wklocmAdj,
        "xDt": xDt,
        "cAct": cAct,
        "previousClose": previousClose,
        "dayEndClose": dayEndCloseValues.reverse[dayEndClose],
        "iislPtsChange": iislPtsChange,
        "iislPercChange": iislPercChange,
        "yPC": yPc,
        "mPC": mPc,
    };
}

enum DayEndClose { EMPTY }

final dayEndCloseValues = EnumValues({
    "-": DayEndClose.EMPTY
});

enum Exchange { NSE }

final exchangeValues = EnumValues({
    "NSE": Exchange.NSE
});

enum Type { EQ }

final typeValues = EnumValues({
    "EQ": Type.EQ
});

class LatestDatum {
    LatestDatum({
        required this.indexName,
        required this.open,
        required this.high,
        required this.low,
        required this.ltp,
        required this.ch,
        required this.chgp,
        required this.yCls,
        required this.mCls,
        required this.yHigh,
        required this.yLow,
    });

    String indexName;
    String open;
    String high;
    String low;
    String ltp;
    String ch;
    String chgp;
    String yCls;
    String mCls;
    String yHigh;
    String yLow;

    factory LatestDatum.fromJson(Map<String, dynamic> json) => LatestDatum(
        indexName: json["indexName"],
        open: json["open"],
        high: json["high"],
        low: json["low"],
        ltp: json["ltp"],
        ch: json["ch"],
        chgp: json["chgp"],
        yCls: json["yCls"],
        mCls: json["mCls"],
        yHigh: json["yHigh"],
        yLow: json["yLow"],
    );

    Map<String, dynamic> toJson() => {
        "indexName": indexName,
        "open": open,
        "high": high,
        "low": low,
        "ltp": ltp,
        "ch": ch,
        "chgp": chgp,
        "yCls": yCls,
        "mCls": mCls,
        "yHigh": yHigh,
        "yLow": yLow,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
