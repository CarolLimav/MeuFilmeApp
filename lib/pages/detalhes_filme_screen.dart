// import 'package:flutter/material.dart';
// import '../models/filme_model.dart';

// class DetalhesFilmes extends StatelessWidget {
//   final Filme filme;

//   const DetalhesFilmes({super.key, required this.filme});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(filme.nome),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(filme.imageUrl),
//             const SizedBox(height: 16.0),
//             const Text(
//               'Sinopse:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(filme.sinopse),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../models/filme_model.dart';

class DetalhesFilmes extends StatelessWidget {
  final Filme filme; 

  const DetalhesFilmes({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(filme.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(filme.imageUrl),
            SizedBox(height: 20,),
            Text('Sinopse',
            style: TextStyle(fontSize: 19,
            
            fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 9,),
            Text(filme.sinopse)
        ]),
      ),
    );
  }
}