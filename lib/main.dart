import 'package:flutter/material.dart';
import 'package:meufilmeapp/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   static int cartItemCount = 0;
   static int filmeCount = 0; 

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Filmes",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

