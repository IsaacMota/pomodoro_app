import 'package:flutter/material.dart';
import 'package:pomodoro/animal.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          'Cartas',
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
        color: Colors.green[300], // Definindo a cor de fundo
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CrystalScore(color: Colors.blue, score: 0),
                  CrystalScore(color: Colors.red, score: 0),
                  CrystalScore(color: Colors.green, score: 0),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  ScoreCard(
                    color: Colors.blue,
                    score: 85,
                    category: 'Animais',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnimalScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  ScoreCard(
                    color: Colors.red,
                    score: 70,
                    category: 'Plantas',
                  ),
                  SizedBox(height: 16.0),
                  ScoreCard(
                    color: Colors.green,
                    score: 95,
                    category: 'Filosofia',
                  ),
                  SizedBox(height: 16.0),
                  ScoreCard(
                    color: Colors.purple,
                    score: 80,
                    category: 'Matemática',
                  ),
                  SizedBox(height: 16.0),
                  ScoreCard(
                    color: Colors.orange,
                    score: 90,
                    category: 'Ciências',
                  ),
                  SizedBox(height: 16.0),
                  ScoreCard(
                    color: Colors.teal,
                    score: 75,
                    category: 'História',
                  ),
                  SizedBox(height: 16.0),
                  ScoreCard(
                    color: Colors.indigo,
                    score: 85,
                    category: 'Geografia',
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

class CrystalScore extends StatelessWidget {
  final Color color;
  final int score;

  CrystalScore({required this.color, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.ac_unit, // Ícone de cristal (substitua pelo ícone desejado)
            color: Colors.white,
            size: 24.0,
          ),
          SizedBox(height: 4.0),
          Text(
            score.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreCard extends StatelessWidget {
  final Color color;
  final int score;
  final String category;
  final Function()? onPressed;

  ScoreCard({
    required this.color,
    required this.score,
    required this.category,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.5),
          child: Text(
            category[0].toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        title: Text(
          category,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        subtitle: Text(
          'Carta 0/100',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
