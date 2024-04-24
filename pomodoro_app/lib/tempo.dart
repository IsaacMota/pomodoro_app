import 'package:flutter/material.dart';
import 'dart:async';

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
    {'name': 'Estudo', 'color': Colors.blue},
    {'name': 'Trabalho', 'color': Colors.red},
    {'name': 'Entretenimento', 'color': Colors.orange},
    {'name': 'Social', 'color': Colors.green},
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
        title: Text('Pomodoro Timer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: changeToWork,
                child: Text('Estudo'),
              ),
              ElevatedButton(
                onPressed: changeToBreak,
                child: Text('Trabalho'),
              ),
              ElevatedButton(
                onPressed: changeToLongBreak,
                child: Text('Entretenimento'),
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
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
              Text(
                formatDuration(secondsRemaining),
                style: TextStyle(fontSize: 48),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: isRunning ? pauseTimer : startTimer,
                child: Text(isRunning ? 'Pausar' : 'Iniciar'),
              ),
              ElevatedButton(
                onPressed: skipTimer,
                child: Text('Pular'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Ciclo: ${completedCycles}#',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetCycleAndTime,
            child: Text('Reiniciar Ciclo e Tempo'),
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
                      color: category['color'],
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(category['name']),
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

