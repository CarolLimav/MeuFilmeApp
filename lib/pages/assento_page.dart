// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';

import 'combos_page.dart';

class Assento extends StatefulWidget {
  const Assento({super.key});

  @override
  _AssentoState createState() => _AssentoState();
}

class _AssentoState extends State<Assento> {
  // Lista para armazenar o estado dos assentos
  final List<bool> _seatStatusList = List.generate(20, (index) => true);
  int indice = -1;

  @override
  void initState() {
    super.initState();
    gerarRandom();
  }

  void gerarRandom() {
    Random random = Random();
    int randomNumber = 0;
    for (int i = 0; i < 2; i++) {
      randomNumber = random.nextInt(20);
      _seatStatusList[randomNumber] = false;
    }
    randomNumber++;
    _seatStatusList[randomNumber] = false;
  }

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Escolha seu assento')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: width,
              color: Colors.black54,
              child: const Center(
                child: Text(
                  "TELA",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            shrinkWrap: true,
            itemCount: _seatStatusList.length,
            padding: const EdgeInsets.all(25),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    if (_seatStatusList[index]) {
                      _seatStatusList[index] = !_seatStatusList[index];
                      if (indice >= 0) {
                        _seatStatusList[indice] = !_seatStatusList[indice];
                      }
                      indice = index;
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _seatStatusList[index] ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'A${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    String message;
                    if (indice < 0) {
                      message = "Selecione um Assento!";
                    } else {
                      message = "A${indice + 1}";
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CombosPage(),));
                    }
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(message)));
                  },
                  child: const Text("Escolher Assento"))
            ],
          ),
        ],
      ),
    );
  }
}
