import 'dart:js_interop';

import 'package:flutter/material.dart';

import '../main.dart';
import '../models/ingresso_model.dart';

class FinalizarPage extends StatelessWidget {
  Ingresso ingresso; 
  // final String filme;
  // final String urlFilme;
  // final String data;
  // final String horario;
  // final String assento;
  // final String tipo;
  // final String tipoValor;
  // final String comboName;
  // final String comboValor;
  // final String total;

   FinalizarPage({super.key,required this.ingresso});
    // required this.filme,
    // required this.urlFilme,
    // required this.data,
    // required this.horario,
    // required this.assento,
    // required this.tipo,
    // required this.tipoValor,
    // required this.comboName,
    // required this.comboValor,
    // required this.total,

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
        title: const Center(child: Text('Comprovante')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
    
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // shrinkWrap: true,
            children: [
              // const Text(
              //   'Comprovante',
              //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  height: 450,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(ingresso.imageUrlFilme!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(child: Text('Filme: ${ingresso.nomeFilme}', style: TextStyle(fontWeight: FontWeight.bold),)),
              const SizedBox(height: 16),
              Center(child: Text('Data: ${ingresso.horario}', style: TextStyle(fontWeight: FontWeight.bold),)),
              const SizedBox(height: 16),
              Center(child: Text('Assento: ${ingresso.assento}', style: TextStyle(fontWeight: FontWeight.bold))),            
              const SizedBox(height: 16),
              Center(child: Text('Total: ${ingresso.valor}', style: TextStyle(fontWeight: FontWeight.bold))),
              const SizedBox(height: 32),
              Center(child: const Text('Apresente esse comprovante na entrada do cinema. ')),     
               Center(child: const Text('Bom filme!')),              
            ],
          ),
        ),
      ),
    );
  }
}

// void main() => runApp(MyApp());

// class Finalizar extends StatelessWidget {
//   Ingre
//   const Finalizar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Carrinho'),
//       ),
//       body: const FinalizarPage(
//         filme: 'Nome do Filme' ,
//         urlFilme:
//             'https://pbs.twimg.com/media/FvUVt3hXgAAxP1H?format=jpg&name=900x900',
//         data: '__/__/__',
//         horario: '00:00',
//         assento: 'l3',
//         tipo: 'Inteira/meia',
//         tipoValor: 'R\$ 10,00',
//         comboName: 'Combo Name',
//         comboValor: 'R\$ 30,00',
//         total: 'R\$ 40,00',
//       ),
//     );
//   }
// }
