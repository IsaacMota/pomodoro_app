import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Cards'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Volta para a tela anterior
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScoreCard(color: Colors.blue, shape: BoxShape.circle, score: 0),
                ScoreCard(color: Colors.red, shape: BoxShape.circle, score: 0),
                ScoreCard(
                    color: Colors.green, shape: BoxShape.circle, score: 0),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ThemeCard(title: 'Animais', count: '00/100'),
                ThemeCard(title: 'Plantas', count: '00/100'),
                ThemeCard(title: 'Filosofia', count: '00/100'),
                ThemeCard(title: 'Geografia', count: '00/100'),
                ThemeCard(title: 'Curiosidades', count: '00/100'),
                ThemeCard(title: 'Biologia', count: '00/100'),
                ThemeCard(title: 'Física', count: '00/100'),
                ThemeCard(title: 'Artes', count: '00/100'),
                ThemeCard(title: 'Química', count: '00/100'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreCard extends StatelessWidget {
  final Color color;
  final BoxShape shape;
  final int score;

  const ScoreCard(
      {Key? key,
      required this.color,
      this.shape = BoxShape.rectangle,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Diminuí o tamanho para 80
      height: 80, // Diminuí o tamanho para 80
      decoration: BoxDecoration(
        color: color,
        shape: shape,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 8,
            child: Text(
              score.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeCard extends StatelessWidget {
  final String title;
  final String count;

  const ThemeCard({Key? key, required this.title, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(count),
        leading: Icon(Icons.description), // Add an icon for the card
        trailing: Icon(Icons.arrow_forward), // Add an icon for the card
      ),
    );
  }
}
