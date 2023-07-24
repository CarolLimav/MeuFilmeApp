import 'package:flutter/material.dart';
import 'package:meufilmeapp/data/combo_data.dart';
import 'package:meufilmeapp/models/combo_model.dart';

class CombosPage extends StatelessWidget {
  final Combo combo;
  const CombosPage({required this.combo, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(combo.nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: listaDeCombos.length,
            itemBuilder: (context, index) {
              Combo combo = listaDeCombos[index];
              return Row(
                children: [
                
                ],
          );
        }),
      ),
    );
  }
}
