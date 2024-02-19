import 'package:flutter/material.dart';
import 'package:suzuki/models/motos.dart';

class DetailMotosPage extends StatefulWidget {
  const DetailMotosPage({Key? key, required this.motos}) : super(key: key);

  final Motos motos;

  @override
  State<DetailMotosPage> createState() => _DetailsMotosPageState();
}

class _DetailsMotosPageState extends State<DetailMotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
