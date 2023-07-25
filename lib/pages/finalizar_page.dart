import 'package:flutter/material.dart';

import '../data/combo_data.dart';
import '../data/filme_data.dart';
import '../models/combo_model.dart';
import '../models/filme_model.dart';

class FinalizarPage extends StatelessWidget {
  final String filme;
  final String urlFilme;
  final String data;
  final String horario;
  final String assento;
  final String tipo;
  final String tipoValor;
  final String comboName;
  final String comboValor;
  final String total;

  FinalizarPage({
    required this.filme,
    required this.urlFilme,
    required this.data,
    required this.horario,
    required this.assento,
    required this.tipo,
    required this.tipoValor,
    required this.comboName,
    required this.comboValor,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
     
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // shrinkWrap: true,
          children: [
            Text(
              'Minhas Compras',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Center(
              child: Container(
                height: 450,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(urlFilme),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(child: Text('Filme: $filme')),
            Center(child: Text('Data: $data')),
            Center(child: Text('Horário: $horario')),
            Center(child: Text('Assento: $assento')),
            SizedBox(height: 16),
            Center(child: Text('$tipo: $tipoValor')),
            Center(child: Text('$comboName: $comboValor')),
            SizedBox(height: 16),
            Center(child: Text('Total: $total')),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Lógica para finalizar a compra aqui
              },
              child: Text('Finalizar Compra'),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() => runApp(MyApp());

class Finalizar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: FinalizarPage(
        filme: 'Nome do Filme' ,
        urlFilme:
            'https://pbs.twimg.com/media/FvUVt3hXgAAxP1H?format=jpg&name=900x900',
        data: '__/__/__',
        horario: '00:00',
        assento: 'l3',
        tipo: 'Inteira/meia',
        tipoValor: 'R\$ 10,00',
        comboName: 'Combo Name',
        comboValor: 'R\$ 30,00',
        total: 'R\$ 40,00',
      ),
    );
  }
}
