import 'package:flutter/material.dart';
import '../models/filme_model.dart';

class DetalhesFilmes extends StatelessWidget {
  final Filme filme;

  const DetalhesFilmes({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(filme.nome),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: height * 0.6,
                        child: Image.network(filme.imageUrl)),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Sinopse',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(filme.sinopse),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Comprar Ingresso",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
