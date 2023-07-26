import 'package:flutter/material.dart';

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

  const FinalizarPage({super.key, 
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
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // shrinkWrap: true,
          children: [
            const Text(
              'Minhas Compras',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            Center(child: Text('Filme: $filme')),
            Center(child: Text('Data: $data')),
            Center(child: Text('Horário: $horario')),
            Center(child: Text('Assento: $assento')),
            const SizedBox(height: 16),
            Center(child: Text('$tipo: $tipoValor')),
            Center(child: Text('$comboName: $comboValor')),
            const SizedBox(height: 16),
            Center(child: Text('Total: $total')),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Lógica para finalizar a compra aqui
              },
              child: const Text('Finalizar Compra'),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() => runApp(MyApp());

class Finalizar extends StatelessWidget {
  const Finalizar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: const FinalizarPage(
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
