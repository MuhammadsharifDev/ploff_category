class BannerResponse {
  List<Banners>? banners;
  String? count;

  BannerResponse({this.banners, this.count});

  BannerResponse.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Banners {
  String? id;
  Title? title;
  String? position;
  String? image;
  String? url;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? shipperId;
  String? about;

  Banners(
      {this.id,
        this.title,
        this.position,
        this.image,
        this.url,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.shipperId,
        this.about});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    position = json['position'];
    image = json['image'];
    url = json['url'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shipperId = json['shipper_id'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['position'] = position;
    data['image'] = image;
    data['url'] = url;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['shipper_id'] = shipperId;
    data['about'] = about;
    return data;
  }
}

class Title {
  String? uz;
  String? ru;
  String? en;

  Title({this.uz, this.ru, this.en});

  Title.fromJson(Map<String, dynamic> json) {
    uz = json['uz'];
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uz'] = uz;
    data['ru'] = ru;
    data['en'] = en;
    return data;
  }
}
