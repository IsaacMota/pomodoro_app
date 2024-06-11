import 'package:flutter/material.dart';
import 'package:pomodoro/amigos.dart';
import 'package:pomodoro/cards.dart';
import 'dart:async';
import 'package:pomodoro/explicacao.dart';
import 'package:pomodoro/perfil.dart';
import 'package:pomodoro/relatorio.dart';

void main() {
  runApp(TempoScreen());
}

class TempoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PomodoroScreen(),
    );
  }
}

class PomodoroScreen extends StatefulWidget {
  @override
  _PomodoroScreenState createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  bool isRunning = false;
  bool isWorkTime = true;
  int workDuration = 25 * 60; // 25 minutes in seconds
  int breakDuration = 5 * 60; // 5 minutes in seconds
  int longBreakDuration = 15 * 60; // 15 minutes in seconds
  int completedCycles = 0;
  int secondsRemaining = 1500; // 25 minutes in seconds
  late Timer timer;
  String selectedCategory = 'Estudo'; // Default selected category
  List<Map<String, dynamic>> categories = [
    {'name': 'Estudo', 'color': Color.fromARGB(255, 22, 123, 255)},
    {'name': 'Trabalho', 'color': Colors.red},
    {'name': 'Entretenimento', 'color': Colors.orange},
    {'name': 'Social', 'color': Color.fromARGB(255, 169, 10, 190)},
    {
      'name': 'Esporte',
      'color': Color.fromARGB(255, 255, 217, 0)
    }, // Novo tema: Esporte
    {
      'name': 'Outro',
      'color': Color.fromARGB(255, 50, 255, 245)
    }, // Novo tema: Outro
  ];

  void startTimer() {
    setState(() {
      isRunning = true;
    });

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          timer.cancel();
          isRunning = false;
          if (isWorkTime) {
            isWorkTime = false;
            completedCycles++;
            if (completedCycles % 4 == 0) {
              secondsRemaining = longBreakDuration;
            } else {
              secondsRemaining = breakDuration;
            }
          } else {
            isWorkTime = true;
            secondsRemaining = workDuration;
          }
        }
      });
    });
  }

  void pauseTimer() {
    setState(() {
      timer.cancel();
      isRunning = false;
    });
  }

  void skipTimer() {
    setState(() {
      timer.cancel();
      isRunning = false;
      if (isWorkTime) {
        isWorkTime = false;
        completedCycles++;
        if (completedCycles % 4 == 0) {
          secondsRemaining = longBreakDuration;
        } else {
          secondsRemaining = breakDuration;
        }
      } else {
        isWorkTime = true;
        secondsRemaining = workDuration;
      }
    });
  }

  void resetCycleAndTime() {
    setState(() {
      completedCycles = 0;
      secondsRemaining = workDuration;
    });
  }

  String formatDuration(int durationInSeconds) {
    int minutes = durationInSeconds ~/ 60;
    int seconds = durationInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void goToSettings() async {
    final newSettings = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SettingsScreen(workDuration, breakDuration)),
    );
    if (newSettings != null) {
      setState(() {
        workDuration = newSettings['workDuration']!;
        breakDuration = newSettings['breakDuration']!;
        secondsRemaining = workDuration;
      });
    }
  }

  void goToExplanationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExplicacaoScreen()),
    );
  }

  void goToProfileScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  }

  void goToFriendsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Amigoslist()),
    );
  }

  void goToReportsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RelatorioScreen()),
    );
  }

  void goToCardsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CardScreen()),
    );
  }

  void changeToWork() {
    if (!isRunning) {
      setState(() {
        isWorkTime = true;
        secondsRemaining = workDuration;
      });
    }
  }

  void changeToBreak() {
    if (!isRunning) {
      setState(() {
        isWorkTime = false;
        secondsRemaining = breakDuration;
      });
    }
  }

  void changeToLongBreak() {
    if (!isRunning) {
      setState(() {
        isWorkTime = false;
        secondsRemaining = longBreakDuration;
      });
    }
  }

  void toggleTimer() {
    if (isRunning) {
      pauseTimer();
    } else {
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors
            .green[900], // Definindo a cor de fundo do topo como verde escuro
        title: Text(
          'Pomodoro Timer',
          style: TextStyle(
              color: Colors.white), // Definindo a cor do texto como branco
        ),
        iconTheme: IconThemeData(
            color: Colors
                .white), // Definindo a cor do ícone da aba lateral como branco
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.green[700], // Cor de fundo verde escuro
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green[900], // Cor de fundo do cabeçalho
                ),
                child: Text(
                  'Pomodoro Timer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_outline,
                    color: Colors.white), // Ícone do perfil
                title: Text(
                  'Perfil',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: goToProfileScreen,
              ),
              ListTile(
                leading: Icon(Icons.people_outline,
                    color: Colors.white), // Ícone de amigos
                title: Text(
                  'Amigos',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: goToFriendsScreen,
              ),
              ListTile(
                leading: Icon(Icons.bar_chart_outlined,
                    color: Colors.white), // Ícone de relatórios
                title: Text(
                  'Relatórios',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: goToReportsScreen,
              ),
              ListTile(
                leading: Icon(Icons.library_books_outlined,
                    color: Colors.white), // Ícone de cards
                title: Text(
                  'Cards',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: goToCardsScreen,
              ),
              ListTile(
                leading: Icon(Icons.info_outline,
                    color: Colors.white), // Ícone de informações
                title: Text(
                  'Informações',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: goToExplanationScreen,
              ),
            ],
          ),
        ),
      ),

      backgroundColor: Colors.green, // Definindo o fundo como verde
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: changeToWork,
                child: Text(
                  'Pomodoro',
                  style: TextStyle(
                      color:
                          Colors.white), // Definindo a cor do texto como branco
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .green[700], // Definindo a cor de fundo como verde escuro
                ),
              ),
              ElevatedButton(
                onPressed: changeToBreak,
                child: Text(
                  'Pausa curta',
                  style: TextStyle(
                      color:
                          Colors.white), // Definindo a cor do texto como branco
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .green[700], // Definindo a cor de fundo como verde escuro
                ),
              ),
              ElevatedButton(
                onPressed: changeToLongBreak,
                child: Text(
                  'Pausa Longa',
                  style: TextStyle(
                      color:
                          Colors.white), // Definindo a cor do texto como branco
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors
                      .green[700], // Definindo a cor de fundo como verde escuro
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: CircularProgressIndicator(
                  value: 1 - (secondsRemaining / workDuration),
                  strokeWidth: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(166, 255, 40, 40)),
                ),
              ),
              Text(
                formatDuration(secondsRemaining),
                style: TextStyle(
                    fontSize: 48,
                    color: Colors.white), // Definindo a cor como branca
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: isRunning ? pauseTimer : startTimer,
                child: Text(
                  isRunning ? 'Pausar ❚❚ ' : 'Iniciar ▶',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: skipTimer,
                child: Text(
                  'Pular ↷ ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Ciclo: ${completedCycles}#',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white), // Definindo a cor como branca
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetCycleAndTime,
            child: Text(
              'Reiniciar Ciclo e Tempo ↺ ',
              style: TextStyle(
                  color: Colors.white), // Definindo a cor do texto como branco
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors
                  .green[700], // Definindo a cor de fundo como verde escuro
            ),
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
            items: categories.map<DropdownMenuItem<String>>((category) {
              return DropdownMenuItem<String>(
                value: category['name'],
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: category[
                          'color'], // Mantendo a cor do ícone conforme especificado para o tema
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      category['name'],
                      style: TextStyle(
                          color: category[
                              'color']), // Definindo a cor do texto com base na cor especificada para o tema
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToSettings,
        tooltip: 'Configurações',
        child: Icon(Icons.settings),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

class SettingsScreen extends StatefulWidget {
  final int initialWorkDuration;
  final int initialBreakDuration;

  SettingsScreen(this.initialWorkDuration, this.initialBreakDuration);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController workMinutesController;
  late TextEditingController workSecondsController;
  late TextEditingController breakMinutesController;
  late TextEditingController breakSecondsController;

  @override
  void initState() {
    super.initState();
    workMinutesController = TextEditingController(
        text: (widget.initialWorkDuration ~/ 60).toString());
    workSecondsController = TextEditingController(
        text: (widget.initialWorkDuration % 60).toString());
    breakMinutesController = TextEditingController(
        text: (widget.initialBreakDuration ~/ 60).toString());
    breakSecondsController = TextEditingController(
        text: (widget.initialBreakDuration % 60).toString());
  }

  @override
  void dispose() {
    workMinutesController.dispose();
    workSecondsController.dispose();
    breakMinutesController.dispose();
    breakSecondsController.dispose();
    super.dispose();
  }

  void saveSettings() {
    final workMinutes = int.tryParse(workMinutesController.text) ?? 25;
    final workSeconds = int.tryParse(workSecondsController.text) ?? 0;
    final breakMinutes = int.tryParse(breakMinutesController.text) ?? 5;
    final breakSeconds = int.tryParse(breakSecondsController.text) ?? 0;

    final workDuration = workMinutes * 60 + workSeconds;
    final breakDuration = breakMinutes * 60 + breakSeconds;

    Navigator.pop(context, {
      'workDuration': workDuration,
      'breakDuration': breakDuration,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tempo de Trabalho',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: workMinutesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Minutos'),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: workSecondsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Segundos'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Tempo de Pausa',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: breakMinutesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Minutos'),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: TextField(
                    controller: breakSecondsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Segundos'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveSettings,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
