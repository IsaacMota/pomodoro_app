import 'package:flutter/material.dart';

class RelatorioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatório'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Volta para a tela anterior
          },
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Informações adicionais
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Horas totais no app
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Horas Totais',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '07:10 horas', // Substitua pelo valor real
                          ),
                        ],
                      ),
                    ),

                    // Dias totais acessados no app
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Dias Totais',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '5 dias', // Substitua pelo valor real
                          ),
                        ],
                      ),
                    ),

                    // Sequencia de dias acessados
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Sequência de Dias',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '3 dias', // Substitua pelo valor real
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Histórico de tempo utilizado em cada tema
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Histórico de Tempo por Tema:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    // Exemplo de histórico de tempo por tema
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
        SizedBox(height: 5.0),
        Column(
          children: tempos.entries.map((entry) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.key), // Data
                  Text(entry.value), // Tempo
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
