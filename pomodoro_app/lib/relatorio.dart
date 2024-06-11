import 'package:flutter/material.dart';

class RelatorioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          'Relatório',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.green[300],
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Horas Totais',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '07:10 horas',
                              style: TextStyle(
                                color: Colors.green[900],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Dias Totais',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '5 dias',
                              style: TextStyle(
                                color: Colors.green[900],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Sequência de Dias',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '3 dias',
                              style: TextStyle(
                                color: Colors.green[900],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: Colors.green[900],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Histórico de Tempo por Tema:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                    SizedBox(height: 10),
                    buildTemaItem(
                      'Estudo',
                      {'22/05/2024': '2 horas', '21/05/2024': '1 hora'},
                      Colors.blue,
                    ),
                    buildTemaItem(
                      'Trabalho',
                      {'23/05/2024': '45 minutos'},
                      Colors.red,
                    ),
                    buildTemaItem(
                      'Entretenimento',
                      {'15/05/2024': '30 minutos', '21/05/2024': '20 minutos'},
                      Colors.orange,
                    ),
                    buildTemaItem(
                      'Social',
                      {'15/05/2024': '1 hora'},
                      Colors.green,
                    ),
                    buildTemaItem(
                      'Esporte',
                      {'13/04/2024': '1 hora e 15 minutos'},
                      Colors.yellow,
                    ),
                    buildTemaItem(
                      'Outro',
                      {'13/04/2024': '20 minutos'},
                      Color.fromARGB(255, 50, 255, 245),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTemaItem(String tema, Map<String, String> tempos, Color cor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tema,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: cor,
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: tempos.entries.map((entry) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.key),
                  Text(entry.value),
                ],
              ),
            );
          }).toList(),
        ),
        Divider(),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RelatorioScreen(),
  ));
}
