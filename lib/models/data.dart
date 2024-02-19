import 'package:flutter/material.dart';
import 'package:suzuki/models/motos.dart';

final listCategory = ['Deportivas', 'Ciudad', 'Trabajo'];

final listMotos = [
  Motos(
    'HAYABUSA 2023',
    'Deportiva',
    '\$434,490',
    5,
    '1300 cc',
    [
      ImageMotos(
        'assets/motos/hayabusa/blancoazul.png',
        const Color.fromARGB(255, 0, 90, 170),
      ),
      ImageMotos(
        'assets/motos/hayabusa/grisrojo.png',
        const Color.fromARGB(255, 66, 66, 66),
      ),
      ImageMotos(
        'assets/motos/hayabusa/negro.png',
        const Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  ),
  Motos(
    'GIXXER SF 2024',
    'Ciudad',
    '\$64,990',
    4,
    '150 cc',
    [
      ImageMotos(
        'assets/motos/gixxer_sf/platanaranja.png',
        const Color.fromARGB(255, 255, 40, 0),
      ),
      ImageMotos(
        'assets/motos/gixxer_sf/negro.png',
        const Color.fromARGB(255, 0, 0, 0),
      ),
      ImageMotos(
        'assets/motos/gixxer_sf/azul.png',
        const Color.fromARGB(255, 11, 86, 156),
      ),
    ],
  ),
  Motos(
    'Huracán 2023',
    'Trabajo',
    '\$36,490',
    4,
    '125 cc',
    [
      ImageMotos(
        'assets/motos/huracan/azul.png',
        const Color.fromARGB(255, 62, 95, 138),
      ),
      ImageMotos(
        'assets/motos/huracan/blanco.png',
        const Color.fromARGB(255, 245, 245, 245),
      ),
      ImageMotos(
        'assets/motos/huracan/rojo.png',
        const Color.fromARGB(255, 230, 13, 46),
      ),
      ImageMotos(
        'assets/motos/huracan/negro.png',
        const Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  ),
];
