// To parse this JSON data, do
//
//     final Categories = CategoriesFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

Categories CategoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String CategoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    required this.data,
    required this.meta,
  });

  List<Categ> data;
  Meta meta;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        data: List<Categ>.from(json["data"].map((x) => Categ.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Categ {
  Categ({
    required this.id,
    required this.attributes,
  });

  int id;
  Attributes attributes;

  factory Categ.fromJson(Map<String, dynamic> json) => Categ(
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
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  DateTime createdAt;
  DateTime updatedAt;
  String name;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "name": name,
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
