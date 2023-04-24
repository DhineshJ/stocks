

class Market {
    Market({
        required this.httpStatus,
        required this.message,
        required this.data,
    });

    String httpStatus;
    String message;
    List<Datum> data;

    factory Market.fromJson(Map<String, dynamic> json) => Market(
        httpStatus: json["httpStatus"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.symbol,
        required this.token,
        required this.ss,
        required this.ltp,
        required this.chg,
        required this.chgp,
        required this.pclose,
        required this.open,
        required this.high,
        required this.low,
        required this.close,
    });

    String symbol;
    String token;
    String ss;
    String ltp;
    String chg;
    String chgp;
    String pclose;
    String open;
    String high;
    String low;
    String close;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        symbol: json["symbol"],
        token: json["token"],
        ss: json["ss"],
        ltp: json["ltp"],
        chg: json["chg"],
        chgp: json["chgp"],
        pclose: json["pclose"],
        open: json["open"],
        high: json["high"],
        low: json["low"],
        close: json["close"],
    );

    Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "token": token,
        "ss": ss,
        "ltp": ltp,
        "chg": chg,
        "chgp": chgp,
        "pclose": pclose,
        "open": open,
        "high": high,
        "low": low,
        "close": close,
    };
}
