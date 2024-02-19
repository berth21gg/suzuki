import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suzuki/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  //defiunición de un constructor para la clase MyApp con parametro key
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'Suzuki Motos',
      theme: ThemeData.dark(),
      home: const HomePageMotos(),
      debugShowCheckedModeBanner: false,
    );
  }
}
