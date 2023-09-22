class CategoryResponse {
  List<Categories>? categories;
  String? count;

  CategoryResponse({this.categories, this.count});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  String? slug;
  String? parentId;
  String? description;
  List<ChildCategories>? childCategories;
  String? image;
  String? orderNo;
  List<Null>? products;
  Title? title;
  Title? descriptionV2;

  Categories(
      {this.id,
        this.name,
        this.slug,
        this.parentId,
        this.description,
        this.childCategories,
        this.image,
        this.orderNo,
        this.products,
        this.title,
        this.descriptionV2});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parentId = json['parent_id'];
    description = json['description'];
    if (json['child_categories'] != null) {
      childCategories = <ChildCategories>[];
      json['child_categories'].forEach((v) {
        childCategories!.add(new ChildCategories.fromJson(v));
      });
    }
    image = json['image'];
    orderNo = json['order_no'];
    if (json['products'] != null) {
      products = <Null>[];
      json['products'].forEach((v) {

      });
    }
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    descriptionV2 = json['description_v2'] != null
        ? new Title.fromJson(json['description_v2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['parent_id'] = this.parentId;
    data['description'] = this.description;
    if (this.childCategories != null) {
      data['child_categories'] =
          this.childCategories!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['order_no'] = this.orderNo;
    if (this.products != null) {

    }
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.descriptionV2 != null) {
      data['description_v2'] = this.descriptionV2!.toJson();
    }
    return data;
  }
}

class ChildCategories {
  String? id;
  String? name;
  String? slug;
  String? parentId;
  String? description;
  String? image;
  String? orderNo;
  List<Null>? products;
  Title? title;
  Title? descriptionV2;

  ChildCategories(
      {this.id,
        this.name,
        this.slug,
        this.parentId,
        this.description,
        this.image,
        this.orderNo,
        this.products,
        this.title,
        this.descriptionV2});

  ChildCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parentId = json['parent_id'];
    description = json['description'];
    image = json['image'];
    orderNo = json['order_no'];
    if (json['products'] != null) {
      products = <Null>[];
      json['products'].forEach((v) {

      });
    }
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    descriptionV2 = json['description_v2'] != null
        ? new Title.fromJson(json['description_v2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['parent_id'] = this.parentId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['order_no'] = this.orderNo;
    if (this.products != null) {

    }
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.descriptionV2 != null) {
      data['description_v2'] = this.descriptionV2!.toJson();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uz'] = this.uz;
    data['ru'] = this.ru;
    data['en'] = this.en;
    return data;
  }
}
