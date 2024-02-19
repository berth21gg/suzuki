import 'package:flutter/material.dart';

class ImageMotos {
  ImageMotos(
    this.image,
    this.color,
  );

  final String image;
  final Color color;
}

class Motos {
  Motos(
    this.name,
    this.category,
    this.price,
    this.punctuation,
    this.cc,
    this.listImage,
  );

  final String name;
  final String category;
  final String price;
  final int punctuation;
  final String cc;
  final List<ImageMotos> listImage;
}
