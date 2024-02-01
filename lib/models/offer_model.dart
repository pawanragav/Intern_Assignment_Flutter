import 'dart:convert';

class OfferModel {
  String? taskId;
  String? title;
  String? thumbnail;
  String? shortDesc;
  String? payout;
  String? ctaShort;
  String? ctaLong;
  String? type;
  String? totalLead;
  bool? isTrending;
  String? earned;
  String? status;
  String? isCompleted;
  Brand? brand;
  int? payoutAmt;
  String? payoutCurrency;
  String? ctaAction;
  CustomData? customData;

  OfferModel({
    this.taskId,
    this.title,
    this.thumbnail,
    this.shortDesc,
    this.payout,
    this.ctaShort,
    this.ctaLong,
    this.type,
    this.totalLead,
    this.isTrending,
    this.earned,
    this.status,
    this.isCompleted,
    this.brand,
    this.payoutAmt,
    this.payoutCurrency,
    this.ctaAction,
    this.customData,
  });

  factory OfferModel.fromRawJson(String str) =>
      OfferModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        taskId: json["taskId"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        shortDesc: json["shortDesc"],
        payout: json["payout"],
        ctaShort: json["ctaShort"],
        ctaLong: json["ctaLong"],
        type: json["type"],
        totalLead: json["total_lead"],
        isTrending: json["isTrending"],
        earned: json["earned"],
        status: json["status"],
        isCompleted: json["isCompleted"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        payoutAmt: json["payout_amt"],
        payoutCurrency: json["payout_currency"],
        ctaAction: json["ctaAction"],
        customData: json["custom_data"] == null
            ? null
            : CustomData.fromJson(json["custom_data"]),
      );

  Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "title": title,
        "thumbnail": thumbnail,
        "shortDesc": shortDesc,
        "payout": payout,
        "ctaShort": ctaShort,
        "ctaLong": ctaLong,
        "type": type,
        "total_lead": totalLead,
        "isTrending": isTrending,
        "earned": earned,
        "status": status,
        "isCompleted": isCompleted,
        "brand": brand?.toJson(),
        "payout_amt": payoutAmt,
        "payout_currency": payoutCurrency,
        "ctaAction": ctaAction,
        "custom_data": customData?.toJson(),
      };
}

class Brand {
  String? brandId;
  String? title;
  String? logo;

  Brand({
    this.brandId,
    this.title,
    this.logo,
  });

  factory Brand.fromRawJson(String str) => Brand.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        brandId: json["brandId"],
        title: json["title"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "brandId": brandId,
        "title": title,
        "logo": logo,
      };
}

class CustomData {
  String? appRating;
  String? wallUrl;
  String? dominantColor;

  CustomData({
    this.appRating,
    this.wallUrl,
    this.dominantColor,
  });

  factory CustomData.fromRawJson(String str) =>
      CustomData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomData.fromJson(Map<String, dynamic> json) => CustomData(
        appRating: json["app_rating"],
        wallUrl: json["wall_url"],
        dominantColor: json["dominant_color"],
      );

  Map<String, dynamic> toJson() => {
        "app_rating": appRating,
        "wall_url": wallUrl,
        "dominant_color": dominantColor,
      };
}
