import 'package:flutter/material.dart';

class Friend {
  final String name;
  final String profilePic;
  final String appUsageTime;

  Friend({
    required this.name,
    required this.profilePic,
    required this.appUsageTime,
  });
}

class Amigoslist extends StatelessWidget {
  final List<Friend> friends = [
    Friend(
      name: "João",
      profilePic: "assets/joao.jpg",
      appUsageTime: "6 meses",
    ),
    Friend(
      name: "Maria",
      profilePic: "assets/maria.jpg",
      appUsageTime: "1 ano",
    ),
    Friend(
      name: "Pedro",
      profilePic: "assets/pedro.jpg",
      appUsageTime: "3 meses",
    ),
    Friend(
      name: "Ana",
      profilePic: "assets/ana.jpg",
      appUsageTime: "2 anos",
    ),
    Friend(
      name: "Carlos",
      profilePic: "assets/carlos.jpg",
      appUsageTime: "8 meses",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          'Lista de Amigos',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.green[300], // Cor de fundo da tela
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white, // Cor de fundo do cartão
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                leading: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: AssetImage(friends[index].profilePic),
                ),
                title: Text(
                  friends[index].name,
                  style: TextStyle(
                    color: Colors.green[900], // Cor do texto do nome
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text(
                  'Tempo de uso: ${friends[index].appUsageTime}',
                  style: TextStyle(
                    color: Colors.green[900], // Cor do texto do tempo de uso
                    fontSize: 14.0,
                  ),
                ),
                onTap: () {
                  // Ação ao clicar em um amigo
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
