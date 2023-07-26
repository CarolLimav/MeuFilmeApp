import 'package:flutter/material.dart';
import 'package:meufilmeapp/data/filme_data.dart';
import 'package:meufilmeapp/pages/home_page.dart';
import '../data/combo_data.dart';
import '../models/combo_model.dart';
import '../models/filme_model.dart';
import '../models/ingresso_model.dart';

class CartPage extends StatelessWidget {
   

   CartPage({super.key, });

  @override
  Widget build(BuildContext context ) {
   var listaIngresso = MyApp.listIngresso; 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Compras'),
      ),
      body: ListView.builder(
        itemCount: listaIngresso.length,
        itemBuilder: (context, index) {
            return ListTile(
              leading: SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  listaIngresso[index].imageUrlFilme!,
                  fit: BoxFit.cover,
                ),
              ),

              title:   Text('Filme: ${listaIngresso[index].nomeFilme}'), 
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(listaIngresso[index].nomeCombo == null? '': listaIngresso[index].nomeCombo!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

                  ),              
                  Text(
                    'Total : R\$ ${listaIngresso[index].valor}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
           
                ],
              ),
            );
         
        },
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:meufilmeapp/data/filme_data.dart';
// import '../data/combo_data.dart';
// import '../models/combo_model.dart';
// import '../models/filme_model.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Minhas Compras'),
//       ),
//       body: ListView.builder(
//         itemCount: listaDeCombos.length,
//         itemBuilder: (context, index) {
//           Combo combo = listaDeCombos[index];
//           Filme filme = listaDeFilmes[index];
//           if (combo.selecionado) {
//             return Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Container(
//                   width: 300,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black, width: 2),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 200,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(filme.imageUrl),
//                             fit: BoxFit.cover,
//                           ),
//                           borderRadius: const BorderRadius.vertical(
//                             top: Radius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Filme: ${filme.nome}',
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Combo: ${combo.nome}',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'R\$ ${combo.preco?.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text('Apresente esse comprovante na entrada do cinema. Bom filme!'),
//                       const SizedBox(height: 16),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           } else {
//             return Container(); // Retorna um widget vazio caso o combo não esteja selecionado
//           }
//         },
//       ),
//     );
//   }
// }

