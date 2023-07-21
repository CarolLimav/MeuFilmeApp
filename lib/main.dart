import 'package:flutter/material.dart';
import 'package:meufilmeapp/pages/home_page.dart';

void main() {
runApp(const MyApp());
}


class MyApp extends StatelessWidget {
const MyApp({super.key});


@override
Widget build(BuildContext context) {
return MaterialApp(
  title: "Filmes",
  theme: ThemeData(
    primarySwatch: Colors.amber
  ),
  home:HomePage(),
  debugShowCheckedModeBanner: false,
);
}
}
// return Scaffold(
// appBar: AppBar(
// title: const Text("Filmes"),
// ),
// body: 
//  return Column(
// children: [
// ListView.builder(
// itemBuilder: (BuildContext context, int index) {
// return Container(
// margin: EdgeInsets.all(8.0),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(12),
// color: Colors.white10),
// );
// },
// )
// ],
// );
// }
// // }
