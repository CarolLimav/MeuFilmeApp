// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:meufilmeapp/pages/assento_page.dart';

import '../models/ingresso_model.dart';

class Horarios {
  String valor;
  bool select;
  Horarios(this.valor, this.select);
}

class Week {
  late bool select;
  late String day;
  List<Horarios> horarios;
  Week({required this.select, required this.day, required this.horarios});
}

class Informations extends StatefulWidget {
  Ingresso ingresso;
  Informations({super.key, required this.ingresso});

  @override
  State<Informations> createState() => _InformationsState();
}

class _InformationsState extends State<Informations> {
  List<Week> days = [];
  String dia = '';
  String? horario;
  int indice = -1;
  int indice2 = -1;
  bool? inteiraCheck = false;
  bool? meiaCheck = false;
  bool? estudanteCheck = false;
  double price = 0.0;

  @override
  void initState() {
    super.initState();
    getDays();
  }

  void getDays() {
    days.add(Week(select: false, day: "SEG", horarios: [
      Horarios("18:00", false),
      Horarios("19:30", false),
      Horarios("21:30", false),
      Horarios("23:00", false),
    ]));
    days.add(Week(select: false, day: "TER", horarios: [
      Horarios("18:20", false),
      Horarios("19:45", false),
      Horarios("21:15", false),
      Horarios("22:55", false),
    ]));
    days.add(Week(select: false, day: "QUA", horarios: [
      Horarios("18:15", false),
      Horarios("15:45", false),
      Horarios("21:30", false),
      Horarios("20:05", false),
      Horarios("23:15", false),
    ]));
    days.add(Week(select: false, day: "QUI", horarios: [
      Horarios("18:45", false),
      Horarios("19:30", false),
      Horarios("21:30", false),
      Horarios("22:10", false),
      Horarios("19:10", false),
      Horarios("19:55", false),
      Horarios("23:55", false),
      Horarios("23:00", false),
      Horarios("23:30", false),
      Horarios("17:00", false),
    ]));
    days.add(Week(select: false, day: "SEX", horarios: [
      Horarios("18:00", false),
      Horarios("19:30", false),
      Horarios("21:30", false),
      Horarios("21:45", false),
      Horarios("19:10", false),
      Horarios("19:25", false),
      Horarios("20:05", false),
      Horarios("23:00", false),
      Horarios("20:30", false),
      Horarios("19:45", false),
    ]));
    days.add(Week(select: false, day: "SAB", horarios: [
      Horarios("19:00", false),
      Horarios("19:30", false),
      Horarios("21:30", false),
      Horarios("22:10", false),
      Horarios("19:10", false),
      Horarios("19:45", false),
      Horarios("20:45", false),
      Horarios("23:00", false),
      Horarios("20:30", false),
      Horarios("21:45", false),
    ]));
    days.add(Week(select: false, day: "DOM", horarios: [
      Horarios("18:00", false),
      Horarios("21:30", false),
      Horarios("21:30", false),
      Horarios("22:10", false),
      Horarios("19:10", false),
      Horarios("19:55", false),
      Horarios("20:05", false),
      Horarios("22:10", false),
      Horarios("21:30", false),
      Horarios("23:45", false),
    ]));
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
                        indice2 = -1;
                        dia = days[index].day;
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
                  child: Text(
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
                child: indice == -1
                    ? const Center(
                        child: Text("Escolha o Dia"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: days[indice].horarios.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              days[indice].horarios[index].select =
                                  !days[indice].horarios[index].select;
                              if (indice2 >= 0) {
                                days[indice].horarios[indice2].select =
                                    !days[indice].horarios[indice2].select;
                              }
                              indice2 = index;
                              horario = days[indice].horarios[index].valor;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 50,
                              height: 25,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: days[indice].horarios[index].select
                                      ? Colors.blue
                                      : Colors.white),
                              child: Center(
                                  child:
                                      Text(days[indice].horarios[index].valor)),
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
                          price = 30.16;
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
                          price = 15.80;
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
                          price = 12.80;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String message = '';
                        if (price == 0.0) message = "Selecione o ingresso!\n";
                        if (dia.isEmpty) message += "Selecione o dia!\n";
                        if (indice2 == -1) message += "Selecione o horário!";
                        if (message.isNotEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(message)));
                        } else {
                          widget.ingresso.valor = price;
                          widget.ingresso.horario = "$dia - $horario";
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  Assento(ingresso: widget.ingresso),
                              ));
                        }
                      },
                      child: const Text("Próximo"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}