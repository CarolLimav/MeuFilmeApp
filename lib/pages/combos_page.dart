// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:meufilmeapp/data/combo_data.dart';
import 'package:meufilmeapp/models/ingresso_model.dart';
import 'package:meufilmeapp/pages/home_page.dart';

class CombosPage extends StatefulWidget {
  Ingresso ingresso; 
  CombosPage({super.key, required this.ingresso});

  @override
  State<CombosPage> createState() => _CombosPageState();
}

class _CombosPageState extends State<CombosPage> {
  int indice = -1; 

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
                return ListTile(
                  leading: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.network(
                      listaDeCombos[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    listaDeCombos[index].nome,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          listaDeCombos[index].descricao,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Text(
                        'R\$ ${listaDeCombos[index].preco?.toStringAsFixed(2)}',
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
                          listaDeCombos[index].selecionado = value!;
                          if(indice >= 0 ){
                            listaDeCombos[indice].selecionado = !listaDeCombos[indice].selecionado; 
                          }
                          indice = index; 
                        });
                      }),
                );
              }),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            if(indice >= 0 ){
              widget.ingresso.valor = listaDeCombos[indice].preco! +  widget.ingresso.valor!; 
              widget.ingresso.nomeCombo = listaDeCombos[indice].nome; 
              listaDeCombos[indice].selecionado = !listaDeCombos[indice].selecionado; 
            }
            MyApp.cartItemCount = 1;
            MyApp.listIngresso.add(widget.ingresso); 
            Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const HomePage(),
            //     ));
          },
          child: const Text('Próximo'),
        ));
  }
}
