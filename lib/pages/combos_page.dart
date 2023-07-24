import 'package:flutter/material.dart';
import 'package:meufilmeapp/data/combo_data.dart';
import 'package:meufilmeapp/models/combo_model.dart';

class CombosPage extends StatelessWidget {
  const CombosPage({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Combos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: listaDeCombos.length,
            itemBuilder: (context, index) {
              Combo combo = listaDeCombos[index];
              return Card(
              margin: const EdgeInsets.all(8),
              color: Colors.amberAccent,
              elevation: 2,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(combo.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          combo.nome,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                               color: Colors.black
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
        }),
      ),
    );
  }
}
