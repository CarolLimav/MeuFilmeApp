import 'package:flutter/material.dart';
import 'package:meufilmeapp/data/combo_data.dart';
import 'package:meufilmeapp/pages/finalizar_page.dart';

class CombosPage extends StatefulWidget {
  const CombosPage({ super.key});

  @override
  State<CombosPage> createState() => _CombosPageState();
}

class _CombosPageState extends State<CombosPage> {
  String botaoTexto = 'Pular';
  
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
              // Combo combo = listaDeCombos[index];
              return ListTile(
              leading: SizedBox(
                width: 80,
                height: 80,
                child: Image.network(listaDeCombos[index].imageUrl,
                fit: BoxFit.cover,
                ),
                
                ),
              title: Text(listaDeCombos[index].nome,
              style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    child: Text(listaDeCombos[index].descricao,
                    textAlign: TextAlign.left,
                    ),
                    ),
                  Text('R\$ ${listaDeCombos[index].preco.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16, 
                  ),
                  ),
                ],
              ),
              trailing: Checkbox(
                value: listaDeCombos[index].selecionado, 
                onChanged: (value) {  
                  setState(() {    
                   listaDeCombos[index].selecionado = value;
                 
                  });
                  }
              ),
            );
            
       
        }),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context) => const FinalizarPage() ));
        }, child: const Text('Finalizar'),
      ),
    );
  }
}
