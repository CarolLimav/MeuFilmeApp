import 'package:flutter/material.dart';
import 'package:meufilmeapp/pages/finalizar_page.dart';
import 'package:meufilmeapp/pages/home_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var listaIngresso = MyApp.listIngresso;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Compras'),
      ),
      body: listaIngresso.isEmpty
          ? const Center(
              child: Text(
                'Você ainda não possui compras.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: listaIngresso.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinalizarPage(
                                  ingresso: listaIngresso[index],
                                )));
                  },
                  child: ListTile(
                    leading: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.network(
                        listaIngresso[index].imageUrlFilme!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text('Filme: ${listaIngresso[index].nomeFilme}'),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            listaIngresso[index].nomeCombo == null
                                ? ''
                                : listaIngresso[index].nomeCombo!,
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
                  ),
                );
              },
            ),
    );
  }
}

