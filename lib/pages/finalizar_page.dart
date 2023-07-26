
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/ingresso_model.dart';

class FinalizarPage extends StatelessWidget {
  Ingresso ingresso;
  FinalizarPage({super.key, required this.ingresso});

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
            children: [
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
              Container(
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromARGB(255, 250, 236, 236),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Center(
                        child: Text(
                      'Filme: ${ingresso.nomeFilme}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 16),
                    Center(
                        child: Text(
                      'Data: ${ingresso.horario}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 16),
                    Center(
                        child: Text('Assento: ${ingresso.assento}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold))),
                    const SizedBox(height: 16),
                    Center(
                        child: Text('Total: R\$${ingresso.valor}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold))),
                    const SizedBox(height: 32),
                    const Center(
                        child: Text(
                            'Apresente esse comprovante na entrada do cinema. ')),
                    const Center(child: Text('Bom filme!')),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
