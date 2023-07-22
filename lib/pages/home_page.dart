
import 'package:flutter/material.dart';
import '../data/filme_data.dart';
import '../models/filme_model.dart';
import 'detalhes_filme_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Filmes em cartaz')),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: listaDeFilmes.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16.0), // espaçamento entre os cards
          itemBuilder: (context, index) {
            Filme filme = listaDeFilmes[index];
            return Center(
              child: SizedBox(
                height: 280,
                width: 300,
                child: Card(
                  color: Colors.amberAccent,
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                         onTap: () {
                       Navigator.push(
                        context,
                      MaterialPageRoute(
                      builder: (context) => DetalhesFilmes(filme: filme),
                      ),
                    );
                  },
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(filme.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          filme.nome,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}





