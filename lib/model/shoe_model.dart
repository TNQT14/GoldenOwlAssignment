import 'dart:convert';

import 'package:flutter/services.dart';

class Shoes {
  int id;
  String image;
  String name;
  String description;
  double price;
  String color;

  Shoes({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });

  factory Shoes.fromJson(Map<String, dynamic> json) => Shoes(
    id: json['id'],
    image: json['image'],
    name: json['name'],
    description: json['description'],
    price: json['price'],
    color: json['color'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['color'] = color;
    return data;
  }
}

final Shoes shoes1= Shoes(
    id: 1,
    image: "https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/air-zoom-pegasus-36-mens-running-shoe-wide-D24Mcz-removebg-preview.png",
    name: "Nike Air Zoom Pegasus 36",
    description: "The iconic Nike Air Zoom Pegasus 36 offers more cooling and mesh that targets breathability across high-heat areas. A slimmer heel collar and tongue reduce bulk, while exposed cables give you a snug fit at higher speeds.",
    price: 108.97,
    color: "#e1e7ed");

Future<List<Shoes>> readJson() async {
  List<Shoes> listShoes = [];
  final String response =
  await rootBundle.loadString('lib/data/shoes.json');
  final data = await json.decode(response);
  for (var element in (data["shoes"] as List<dynamic>)) {
    listShoes.add(Shoes.fromJson(element));
  }
  return listShoes;
}



