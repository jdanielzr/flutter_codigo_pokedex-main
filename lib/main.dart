import 'package:flutter/material.dart';
import 'package:flutter_codigo_pokedex/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "PokedexApp",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
