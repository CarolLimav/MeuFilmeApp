import 'package:flutter/material.dart';
import '../data/filme_data.dart';
import '../models/filme_model.dart';
import 'detalhes_filme_page.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
          itemCount: listaDeFilmes.length,
          itemBuilder: (context, index) {
            Filme filme = listaDeFilmes[index];
            return Center(
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
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
                                  builder: (context) =>
                                      DetalhesFilmes(filme: filme),
                                ),
                              );
                            },
                            child: Container(
                              height: 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(filme.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Center(
                            child: Text(
                              filme.nome,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 84, 177, 253)),
                            ),
                          ),
                        ),
                      ],
                    ),
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
