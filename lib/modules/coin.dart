// To parse this JSON data, do
//
//     final dataCoin = dataCoinFromJson(jsonString);

import 'dart:convert';

List<DataCoin> dataCoinFromJson(String str) => List<DataCoin>.from(json.decode(str).map((x) => DataCoin.fromJson(x)));

String dataCoinToJson(List<DataCoin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataCoin {
    DataCoin({
        this.id,
        this.currency,
        this.symbol,
        this.name,
        this.logoUrl,
        this.status,
        this.price,
        this.priceDate,
        this.priceTimestamp,
        this.circulatingSupply,
        this.maxSupply,
        this.marketCap,
        this.numExchanges,
        this.numPairs,
        this.numPairsUnmapped,
        this.firstCandle,
        this.firstTrade,
        this.firstOrderBook,
        this.rank,
        this.rankDelta,
        this.high,
        this.highTimestamp,
        this.the1D,
        this.the30D,
        this.firstPricedAt,
    });

    String id;
    String currency;
    String symbol;
    String name;
    String logoUrl;
    Status status;
    String price;
    DateTime priceDate;
    DateTime priceTimestamp;
    String circulatingSupply;
    String maxSupply;
    String marketCap;
    String numExchanges;
    String numPairs;
    String numPairsUnmapped;
    DateTime firstCandle;
    DateTime firstTrade;
    DateTime firstOrderBook;
    String rank;
    String rankDelta;
    String high;
    DateTime highTimestamp;
    The1D the1D;
    The1D the30D;
    DateTime firstPricedAt;

    factory DataCoin.fromJson(Map<String, dynamic> json) => DataCoin(
        id: json["id"] == null ? null : json["id"],
        currency: json["currency"] == null ? null : json["currency"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        name: json["name"] == null ? null : json["name"],
        logoUrl: json["logo_url"] == null ? null : json["logo_url"],
        status: json["status"] == null ? null : statusValues.map[json["status"]],
        price: json["price"] == null ? null : json["price"],
        priceDate: json["price_date"] == null ? null : DateTime.parse(json["price_date"]),
        priceTimestamp: json["price_timestamp"] == null ? null : DateTime.parse(json["price_timestamp"]),
        circulatingSupply: json["circulating_supply"] == null ? null : json["circulating_supply"],
        maxSupply: json["max_supply"] == null ? null : json["max_supply"],
        marketCap: json["market_cap"] == null ? null : json["market_cap"],
        numExchanges: json["num_exchanges"] == null ? null : json["num_exchanges"],
        numPairs: json["num_pairs"] == null ? null : json["num_pairs"],
        numPairsUnmapped: json["num_pairs_unmapped"] == null ? null : json["num_pairs_unmapped"],
        firstCandle: json["first_candle"] == null ? null : DateTime.parse(json["first_candle"]),
        firstTrade: json["first_trade"] == null ? null : DateTime.parse(json["first_trade"]),
        firstOrderBook: json["first_order_book"] == null ? null : DateTime.parse(json["first_order_book"]),
        rank: json["rank"] == null ? null : json["rank"],
        rankDelta: json["rank_delta"] == null ? null : json["rank_delta"],
        high: json["high"] == null ? null : json["high"],
        highTimestamp: json["high_timestamp"] == null ? null : DateTime.parse(json["high_timestamp"]),
        the1D: json["1d"] == null ? null : The1D.fromJson(json["1d"]),
        the30D: json["30d"] == null ? null : The1D.fromJson(json["30d"]),
        firstPricedAt: json["first_priced_at"] == null ? null : DateTime.parse(json["first_priced_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "currency": currency == null ? null : currency,
        "symbol": symbol == null ? null : symbol,
        "name": name == null ? null : name,
        "logo_url": logoUrl == null ? null : logoUrl,
        "status": status == null ? null : statusValues.reverse[status],
        "price": price == null ? null : price,
        "price_date": priceDate == null ? null : priceDate.toIso8601String(),
        "price_timestamp": priceTimestamp == null ? null : priceTimestamp.toIso8601String(),
        "circulating_supply": circulatingSupply == null ? null : circulatingSupply,
        "max_supply": maxSupply == null ? null : maxSupply,
        "market_cap": marketCap == null ? null : marketCap,
        "num_exchanges": numExchanges == null ? null : numExchanges,
        "num_pairs": numPairs == null ? null : numPairs,
        "num_pairs_unmapped": numPairsUnmapped == null ? null : numPairsUnmapped,
        "first_candle": firstCandle == null ? null : firstCandle.toIso8601String(),
        "first_trade": firstTrade == null ? null : firstTrade.toIso8601String(),
        "first_order_book": firstOrderBook == null ? null : firstOrderBook.toIso8601String(),
        "rank": rank == null ? null : rank,
        "rank_delta": rankDelta == null ? null : rankDelta,
        "high": high == null ? null : high,
        "high_timestamp": highTimestamp == null ? null : highTimestamp.toIso8601String(),
        "1d": the1D == null ? null : the1D.toJson(),
        "30d": the30D == null ? null : the30D.toJson(),
        "first_priced_at": firstPricedAt == null ? null : firstPricedAt.toIso8601String(),
    };
}

enum Status { ACTIVE }

final statusValues = EnumValues({
    "active": Status.ACTIVE
});

class The1D {
    The1D({
        this.volume,
        this.priceChange,
        this.priceChangePct,
        this.volumeChange,
        this.volumeChangePct,
        this.marketCapChange,
        this.marketCapChangePct,
    });

    String volume;
    String priceChange;
    String priceChangePct;
    String volumeChange;
    String volumeChangePct;
    String marketCapChange;
    String marketCapChangePct;

    factory The1D.fromJson(Map<String, dynamic> json) => The1D(
        volume: json["volume"] == null ? null : json["volume"],
        priceChange: json["price_change"] == null ? null : json["price_change"],
        priceChangePct: json["price_change_pct"] == null ? null : json["price_change_pct"],
        volumeChange: json["volume_change"] == null ? null : json["volume_change"],
        volumeChangePct: json["volume_change_pct"] == null ? null : json["volume_change_pct"],
        marketCapChange: json["market_cap_change"] == null ? null : json["market_cap_change"],
        marketCapChangePct: json["market_cap_change_pct"] == null ? null : json["market_cap_change_pct"],
    );

    Map<String, dynamic> toJson() => {
        "volume": volume == null ? null : volume,
        "price_cha nge": priceChange== null ? null : priceChange,
        "price_change_pct": priceChangePct == null ? null : priceChangePct,
        "volume_change": volumeChange == null ? null : volumeChange,
        "volume_change_pct": volumeChangePct == null ? null : volumeChangePct,
        "market_cap_change": marketCapChange == null ? null : marketCapChange,
        "market_cap_change_pct": marketCapChangePct == null ? null : marketCapChangePct,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
