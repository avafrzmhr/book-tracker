// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

List<Books> booksFromJson(String str) =>
    List<Books>.from(json.decode(str).map((x) => Books.fromJson(x)));

String booksToJson(List<Books> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Books {
  int id;
  List<dynamic> reviews;
  String name;
  String description;
  String author;
  int ratings;
  String average;
  int pages;
  String genre;
  DateTime firstPublished;
  DateTime lastUpdate;
  String image;

  Books({
    required this.id,
    required this.reviews,
    required this.name,
    required this.description,
    required this.author,
    required this.ratings,
    required this.average,
    required this.pages,
    required this.genre,
    required this.firstPublished,
    required this.lastUpdate,
    required this.image,
  });

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        id: json["id"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        name: json["name"],
        description: json["description"],
        author: json["author"],
        ratings: json["ratings"],
        average: json["average"],
        pages: json["pages"],
        genre: json["genre"],
        firstPublished: DateTime.parse(json["first_published"]),
        lastUpdate: DateTime.parse(json["last_update"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "name": name,
        "description": description,
        "author": author,
        "ratings": ratings,
        "average": average,
        "pages": pages,
        "genre": genre,
        "first_published": firstPublished.toIso8601String(),
        "last_update": lastUpdate.toIso8601String(),
        "image": image,
      };
}
