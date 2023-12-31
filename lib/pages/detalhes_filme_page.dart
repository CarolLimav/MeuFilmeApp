import 'package:flutter/material.dart';
import 'package:meufilmeapp/models/ingresso_model.dart';
import 'package:meufilmeapp/pages/informations_page.dart';
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
                    Expanded(
                      child: SizedBox(
                          height: height * 0.6,
                          child: Image.network(filme.imageUrl)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Sinopse',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(
                  filme.descricao,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(filme.sinopse),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Ingresso ingresso = Ingresso();
                          ingresso.nomeFilme = filme.nome;
                          ingresso.imageUrlFilme = filme.imageUrl; 
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Informations(ingresso: ingresso,)));
                        },
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

