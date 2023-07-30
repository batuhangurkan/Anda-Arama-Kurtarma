import 'dart:convert';

DepremModel depremModelFromJson(String str) =>
    DepremModel.fromJson(json.decode(str));

String depremModelToJson(DepremModel data) => json.encode(data.toJson());

class DepremModel {
  var place;

  DepremModel({
    required this.status,
    required this.result,
  });

  bool status;
  List<Result> result;

  factory DepremModel.fromJson(Map<String, dynamic> json) => DepremModel(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };

  void forEach(Null Function(dynamic value) param0) {}
}

class Result {
  Result({
    required this.mag,
    required this.lokasyon,
    required this.depth,
    required this.title,
    required this.rev,
    required this.timestamp,
    required this.date,
    required this.hash,
    required this.hash2,
  });

  double? mag;
  String? lokasyon;
  double? depth;
  String title;
  dynamic rev;
  int? timestamp;
  String date;
  String? hash;
  String? hash2;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        mag: json["mag"].toDouble(),
        lokasyon: json["lokasyon"],
        depth: json["depth"].toDouble(),
        title: json["title"],
        rev: json["rev"],
        timestamp: json["timestamp"],
        date: json["date"],
        hash: json["hash"],
        hash2: json["hash2"],
      );

  Map<String, dynamic> toJson() => {
        "mag": mag,
        "lokasyon": lokasyon,
        "depth": depth,
        "title": title,
        "rev": rev,
        "timestamp": timestamp,
        "date": date,
        "hash": hash,
        "hash2": hash2,
      };
}
