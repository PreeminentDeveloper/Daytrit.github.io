// To parse this JSON data, do
//
//     final fetchHomeDataResponse = fetchHomeDataResponseFromMap(jsonString);

import 'dart:convert';

FetchHomeDataResponse fetchHomeDataResponseFromMap(Map<String, dynamic> str) => FetchHomeDataResponse.fromMap(str);

String fetchHomeDataResponseToMap(FetchHomeDataResponse data) => json.encode(data.toMap());

class FetchHomeDataResponse {
  FetchHomeDataResponse({
     this.success,
     this.data,
     this.message,
  });

  bool? success;
  Data? data;
  String? message;

  FetchHomeDataResponse copyWith({
    bool? success,
    Data? data,
    String? message,
  }) =>
      FetchHomeDataResponse(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory FetchHomeDataResponse.fromMap(Map<String, dynamic> json) => FetchHomeDataResponse(
    success: json["success"],
    data: Data.fromMap(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "data": data!.toMap(),
    "message": message,
  };
}

class Data {
  Data({
    this.currentPage,
    required this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<HomeData> data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data copyWith({
    int? currentPage,
    List<HomeData>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      Data(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        links: links ?? this.links,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<HomeData>.from(json["data"].map((x) => HomeData.fromMap(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toMap() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toMap())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class HomeData {
  HomeData({
    required this.id,
    required this.title,
    required this.state,
    required this.country,
    required this.address,
    required this.rating,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String state;
  String country;
  String address;
  String rating;
  String photo;
  dynamic createdAt;
  dynamic updatedAt;
  String get image => 'https://daytrit.net/$photo';

  HomeData copyWith({
    int? id,
    String? title,
    String? state,
    String? country,
    String? address,
    String? rating,
    String? photo,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      HomeData(
        id: id ?? this.id,
        title: title ?? this.title,
        state: state ?? this.state,
        country: country ?? this.country,
        address: address ?? this.address,
        rating: rating ?? this.rating,
        photo: photo ?? this.photo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory HomeData.fromMap(Map<String, dynamic> json) => HomeData(
    id: json["id"],
    title: json["title"],
    state: json["state"],
    country: json["country"],
    address: json["address"],
    rating: json["rating"],
    photo: json["photo"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "state": state,
    "country": country,
    "address": address,
    "rating": rating,
    "photo": photo,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

  factory Link.fromMap(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toMap() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
