// To parse this JSON data, do
//
//     final Products = ProductsFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

Products productsFromJson(String str) {
  // print("Calling");
  // print(json.decode(str));
  return Products.fromJson(json.decode(str));
}

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.data,
    required this.meta,
  });

  List<Product> data;
  Meta meta;

  factory Products.fromJson(Map<String, dynamic> json) {
    // print(json["data"]);
    return Products(
      data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      meta: Meta.fromJson(json["meta"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Product {
  Product({
    required this.id,
    required this.attributes,
  });

  int id;
  ProductAttributes attributes;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      attributes: ProductAttributes.fromJson(json["attributes"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class ProductAttributes {
  ProductAttributes({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.quantity,
  });

  String title;
  double price;
  String description;
  String image;
  Rating rating;
  DateTime createdAt;
  DateTime updatedAt;
  Category category;
  int quantity;

  factory ProductAttributes.fromJson(Map<String, dynamic> json) {
    print(json["category"]);
    return ProductAttributes(
      title: json["title"],
      price: json["price"].toDouble(),
      description: json["description"],
      image: json["image"],
      rating: Rating.fromJson(json["rating"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      category: Category.fromJson(
        json["category"],
      ),
      quantity: 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "rating": rating.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "category": category.toJson(),
      };
}

class Category {
  Category({
    required this.data,
  });

  Data data;

  factory Category.fromJson(Map<String, dynamic> json) {
    print(json);
    return Category(
      data: Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.attributes,
  });

  int id;
  DataAttributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class DataAttributes {
  DataAttributes({
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  DateTime createdAt;
  DateTime updatedAt;
  Name name;

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: nameValues.map[json["name"]] as Name,
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "name": nameValues.reverse[name],
      };
}

enum Name { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final nameValues = EnumValues({
  "electronics": Name.ELECTRONICS,
  "jewelery": Name.JEWELERY,
  "men's clothing": Name.MEN_S_CLOTHING,
  "women's clothing": Name.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

class Meta {
  Meta({
    required this.pagination,
  });

  Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  int page;
  int pageSize;
  int pageCount;
  int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
