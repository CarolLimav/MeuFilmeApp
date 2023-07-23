// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Week {
  late bool select;
  late String day;
  Week({required this.select, required this.day});
}

class Informations extends StatefulWidget {
  const Informations({super.key});

  @override
  State<Informations> createState() => _InformationsState();
}

class _InformationsState extends State<Informations> {
  List<Week> days = [];
  int indice = -1;
  bool? inteiraCheck = false;
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

  @override
  Widget build(BuildContext context) {
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
                      }
                    });
                  },
                  child: Container(
                    width: 100,
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
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.greenAccent,
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
                    subtitle: const Text("R\$ 15,08"),
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
                    subtitle: const Text("R\$ 12,08"),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
