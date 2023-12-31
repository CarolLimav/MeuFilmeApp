import 'package:flutter/material.dart';
import 'package:meufilmeapp/models/ingresso_model.dart';
import '../data/filme_data.dart';
import '../models/filme_model.dart';
import 'cart_page.dart';
import 'detalhes_filme_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static int cartItemCount = 0;
  static int filmeCount= 0;
  static List<Ingresso> listIngresso = [];
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
        actions: [
          IconButton(onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
          }, 
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
        if (MyApp.cartItemCount > 0)
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      MyApp.cartItemCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
          itemCount: listaDeFilmes.length,
          itemBuilder: (context, index) {
            Filme filme = listaDeFilmes[index];
            return GestureDetector(
                  onTap: () {
                   Navigator.push(
                      context,
                       MaterialPageRoute(
                          builder: (context) =>
                            DetalhesFilmes(filme: filme),
                            ),
                        );
                    },       
              child: Card(
                margin: const EdgeInsets.all(8),
                color: Colors.amberAccent,
                elevation: 2,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                              child: Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(filme.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                             // )
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            filme.nome,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                // color: Colors.black87,
                                
                                 color: Color.fromARGB(255, 84, 177, 253)
                                ),
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
