import 'dart:convert';

List<IDCard> idCardFromJson(String str) =>
    List<IDCard>.from(json.decode(str).map((x) => IDCard.fromJson(x)));

String idCardToJson(List<IDCard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IDCard {
  String? id;
  String? name;

  IDCard({
    this.id,
    this.name,
  });

  factory IDCard.fromJson(Map<String, dynamic> json) => IDCard(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
