import 'package:flutter/material.dart';
import 'package:pomodoro_app/tempo.dart';

class Friend {
  final String name;
  final String profilePic;
  final String appUsageTime;

  Friend(
      {required this.name,
      required this.profilePic,
      required this.appUsageTime});
}

class Amigoslist extends StatelessWidget {
  final List<Friend> friends = [
    Friend(
        name: "João", profilePic: "assets/joao.jpg", appUsageTime: "6 meses"),
    Friend(
        name: "Maria", profilePic: "assets/maria.jpg", appUsageTime: "1 ano"),
    Friend(
        name: "Pedro", profilePic: "assets/pedro.jpg", appUsageTime: "3 meses"),
    Friend(name: "Ana", profilePic: "assets/ana.jpg", appUsageTime: "2 anos"),
    Friend(
        name: "Carlos",
        profilePic: "assets/carlos.jpg",
        appUsageTime: "8 meses"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/Temposcreen': (context) => TempoScreen()},
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Amigos'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Volta para a tela anterior
            },
          ),
        ),
        body: ListView.builder(
          itemCount: friends.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(friends[index].profilePic),
              ),
              title: Text(friends[index].name),
              subtitle: Text('Tempo de uso: ${friends[index].appUsageTime}'),
              onTap: () {
                // Ação ao clicar em um amigo
              },
            );
          },
        ),
      ),
    );
  }
}
