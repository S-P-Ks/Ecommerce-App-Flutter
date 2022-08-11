// To parse this JSON data, do
//
//     final Products = ProductsFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.data,
    required this.meta,
  });

  List<Product> data;
  Meta meta;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

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
  Attributes attributes;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
    required this.quantity,
  });

  String title;
  double price;
  String description;
  String image;
  Rating rating;
  DateTime createdAt;
  DateTime updatedAt;
  int quantity;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        quantity: 0,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "rating": rating.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "quantity": quantity
      };
}

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
