// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../models/filme_model.dart';


// class HomePage extends StatelessWidget {
// const HomePage({super.key});

// @override
// Widget build(BuildContext context, WidgetRef ref) {
//  final contadorProvider = StateProvider((ref) => 0);
//  final Filme filme = ref.watch(c);
// return Scaffold(appBar: 
//   AppBar(
//     title: Text("Filmes",
//     textAlign: TextAlign.start,
//     ),
//   ),
//   body: SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: 
//       Column(children: [
//         Text('Filmes em cartaz',
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 30,
//         ),
//         ),
//         SizedBox(height: 20,),
//         Stack(
//           children:[ 
//             Container(
//             height: 300,
//             width: double.infinity,
//             child: Image.network(filme.imageUrl,
//             fit: BoxFit.cover,),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.black, 
//             ),
//           ),
//           ]
//         ),
//       ]),
//     ),
//   ),
//   );
// }
// }
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





