// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meufilmeapp/models/combo_model.dart';
import 'package:meufilmeapp/pages/assento_page.dart';

class Week {
  late bool select;
  late String day;
  Week({required this.select, required this.day});
}

class Informations extends StatefulWidget {
  const Informations({super.key, required List<Combo> combosSelecionados, required double valorIngresso});

  @override
  State<Informations> createState() => _InformationsState();
}

class _InformationsState extends State<Informations> {
  List<Week> days = [];
  List<String> horarios = [];
  int indice = -1;
  bool? inteiraCheck = false;
  List<String> horas = [
    "18:00",
    "19:30",
    "21:30",
    "22:10",
    "19:10",
    "19:20",
    "20:05",
    "23:00",
    "20:30",
    "21:45"
  ];
  bool? meiaCheck = false;
  bool? estudanteCheck = false;

  @override
  void initState() {
    super.initState();
    getDays();
  }

  void getDays() {
    days.add(Week(select: false, day: "SEG"));
    days.add(Week(select: false, day: "TER"));
    days.add(Week(select: false, day: "QUA"));
    days.add(Week(select: false, day: "QUI"));
    days.add(Week(select: false, day: "SEX"));
    days.add(Week(select: false, day: "SAB"));
    days.add(Week(select: false, day: "DOM"));
  }

  void changeData() {
    horarios.clear();
    Random random = Random();
    int count = random.nextInt(5) + 2;
    for (var i = 0; i < count; i++) {
      horarios.add(horas[random.nextInt(10)]);
    }
  }

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Informações do Ingresso"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(25),
                itemCount: days.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!days[index].select) {
                        days[index].select = !days[index].select;
                        if (indice >= 0) {
                          days[indice].select = !days[indice].select;
                        }
                        indice = index;
                        changeData();
                      }
                    });
                  },
                  child: Container(
                    width: width * 0.13,
                    height: 100,
                    color: days[index].select ? Colors.green : Colors.blue,
                    child: Center(
                      child: Text(
                        days[index].day,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 60,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.yellow),
                child: const Center(
                  child:  Text(
                    "Horários",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromARGB(255, 250, 236, 236),
                ),
                child: horarios.isEmpty
                    ? const Center(
                        child: Text("Escolha o Dia"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: horarios.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white
                              ),
                              child: Center(child: Text(horarios[index])),
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  ListTile(
                    title: const Text("ENTRADA (INTEIRA)"),
                    subtitle: const Text("R\$ 30,16"),
                    trailing: Checkbox(
                      value: inteiraCheck,
                      onChanged: (value) {
                        setState(() {
                          inteiraCheck = value;
                          meiaCheck = false;
                          estudanteCheck = false;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text("MEIA ENTRADA"),
                    subtitle: const Text("R\$ 15,80"),
                    trailing: Checkbox(
                      value: meiaCheck,
                      onChanged: (value) {
                        setState(() {
                          meiaCheck = value;
                          inteiraCheck = false;
                          estudanteCheck = false;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text("ESTUDANTE"),
                    subtitle: const Text("R\$ 12,80"),
                    trailing: Checkbox(
                      value: estudanteCheck,
                      onChanged: (value) {
                        setState(() {
                          estudanteCheck = value;
                          inteiraCheck = false;
                          meiaCheck = false;
                        });
                      },
                    ),
                  ),                  
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Assento(),));
                  }, child: const Text("Próximo"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
